-- ============================================================
-- Project: CRM Migration — On-Premise to Salesforce
-- BA: Mohan Sarath Ayinabathini
-- Company: Home Equity Bank, Toronto
-- Used for: Data profiling, validation, and UAT reporting
-- ============================================================


-- 1. DATA PROFILING
-- First thing I ran when I got the legacy data export.
-- Needed to understand what we were working with before
-- writing the BRD data requirements.
-- ============================================================
SELECT
    account_type,
    record_status,
    COUNT(customer_id) AS total_records,
    ROUND(COUNT(customer_id) * 100.0 / SUM(COUNT(customer_id)) OVER (), 1) AS pct_of_total
FROM
    legacy_customer_master
GROUP BY
    account_type,
    record_status
ORDER BY
    total_records DESC;


-- 2. MANDATORY FIELD CHECK
-- Ran this before migration to flag any records missing
-- fields that Salesforce requires at creation.
-- Output went to the Data Governance Lead for review.
-- ============================================================
SELECT
    customer_id,
    first_name,
    last_name,
    email_address,
    phone_number,
    CASE
        WHEN first_name IS NULL OR first_name = ''
            THEN 'Missing first name'
        WHEN last_name IS NULL OR last_name = ''
            THEN 'Missing last name'
        WHEN email_address IS NULL OR email_address = ''
            THEN 'Missing email'
        WHEN phone_number IS NULL OR phone_number = ''
            THEN 'Missing phone'
        ELSE 'OK'
    END AS field_check,
    CASE
        WHEN first_name IS NULL OR first_name = ''
          OR last_name IS NULL OR last_name = ''
          OR email_address IS NULL OR email_address = ''
          OR phone_number IS NULL OR phone_number = ''
            THEN 'Hold — needs cleansing'
        ELSE 'Ready to migrate'
    END AS migration_flag
FROM
    legacy_customer_master
WHERE
    record_status = 'Active'
    AND (
        first_name IS NULL OR first_name = ''
        OR last_name IS NULL OR last_name = ''
        OR email_address IS NULL OR email_address = ''
        OR phone_number IS NULL OR phone_number = ''
    )
ORDER BY
    customer_id ASC;


-- 3. DUPLICATE DETECTION
-- Found ~3,200 duplicate emails in the source system.
-- Flagged by severity — critical ones went to Data Steward
-- before we touched anything in the migration load.
-- ============================================================
SELECT
    email_address,
    COUNT(customer_id) AS record_count,
    MIN(created_date) AS oldest_record,
    MAX(created_date) AS newest_record,
    CASE
        WHEN COUNT(customer_id) > 3 THEN 'Critical — escalate'
        WHEN COUNT(customer_id) = 3 THEN 'High — review needed'
        WHEN COUNT(customer_id) = 2 THEN 'Standard — data steward'
    END AS severity
FROM
    legacy_customer_master
WHERE
    record_status = 'Active'
GROUP BY
    email_address
HAVING
    COUNT(customer_id) > 1
ORDER BY
    record_count DESC;


-- 4. POST-MIGRATION RECORD COUNT CHECK
-- Ran this immediately after each migration batch to confirm
-- nothing dropped in transit. Any variance stopped the load.
-- ============================================================
SELECT
    'Legacy source' AS system_name,
    COUNT(customer_id) AS record_count,
    SUM(account_balance) AS total_balance
FROM
    legacy_customer_master
WHERE
    record_status = 'Active'

UNION ALL

SELECT
    'Salesforce target' AS system_name,
    COUNT(customer_id) AS record_count,
    SUM(account_balance) AS total_balance
FROM
    target_crm_customers
WHERE
    record_status = 'Active';


-- 5. BALANCE RECONCILIATION
-- Finance sign-off requirement — any variance over $0.01
-- had to be investigated before we could close the sprint.
-- We found max variance of $0.003 — rounding on the source.
-- ============================================================
SELECT
    legacy_customer_master.customer_id,
    legacy_customer_master.first_name,
    legacy_customer_master.last_name,
    source_accounts.account_balance AS source_balance,
    target_accounts.account_balance AS target_balance,
    ABS(source_accounts.account_balance - target_accounts.account_balance) AS variance,
    CASE
        WHEN ABS(source_accounts.account_balance - target_accounts.account_balance) = 0
            THEN 'Match'
        WHEN ABS(source_accounts.account_balance - target_accounts.account_balance) <= 0.01
            THEN 'Within tolerance'
        ELSE 'Investigate'
    END AS reconciliation_result
FROM
    source_accounts
JOIN
    legacy_customer_master
    ON source_accounts.customer_id = legacy_customer_master.customer_id
LEFT JOIN
    target_accounts
    ON source_accounts.account_id = target_accounts.account_id
WHERE
    ABS(source_accounts.account_balance - target_accounts.account_balance) > 0
ORDER BY
    variance DESC;


-- 6. HIGH-VALUE ACCOUNT VERIFICATION
-- Risk team asked us to personally verify every account
-- over $100K made it across correctly. This was the query
-- I shared in the sprint review with the Risk Manager.
-- ============================================================
SELECT
    source_accounts.account_id,
    legacy_customer_master.first_name,
    legacy_customer_master.last_name,
    source_accounts.account_balance,
    CASE
        WHEN source_accounts.account_balance >= 1000000 THEN 'Tier 1 — VP review'
        WHEN source_accounts.account_balance >= 500000  THEN 'Tier 2 — Manager review'
        WHEN source_accounts.account_balance >= 100000  THEN 'Tier 3 — Standard review'
    END AS review_tier,
    CASE
        WHEN target_accounts.account_id IS NOT NULL THEN 'Confirmed in Salesforce'
        ELSE 'Not found — action needed'
    END AS target_status
FROM
    source_accounts
JOIN
    legacy_customer_master
    ON source_accounts.customer_id = legacy_customer_master.customer_id
LEFT JOIN
    target_accounts
    ON source_accounts.account_id = target_accounts.account_id
WHERE
    source_accounts.account_balance >= 100000
ORDER BY
    source_accounts.account_balance DESC;


-- 7. UAT DEFECT SUMMARY
-- Generated this for the UAT sign-off meeting.
-- Showed pass rate by module so stakeholders could see
-- exactly where the 6 defects sat before approving go-live.
-- ============================================================
SELECT
    module_name,
    COUNT(test_case_id) AS total_tests,
    SUM(CASE WHEN test_result = 'Pass' THEN 1 ELSE 0 END) AS passed,
    SUM(CASE WHEN test_result = 'Fail' THEN 1 ELSE 0 END) AS failed,
    ROUND(
        SUM(CASE WHEN test_result = 'Pass' THEN 1 ELSE 0 END) * 100.0 / COUNT(test_case_id), 1
    ) AS pass_rate
FROM
    uat_test_cases
WHERE
    sprint_id = 'SPRINT-05'
GROUP BY
    module_name
ORDER BY
    pass_rate ASC;
