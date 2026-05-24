-- ============================================================
-- PROJECT: On-Premise to Cloud Data Migration
-- Business Analyst: Mohan Sarath Ayinabathini
-- Organization: Home Equity Bank / Citi Group
-- Domain: Banking & Financial Services
-- Purpose: End-to-end BA SQL artifacts covering BRD, FRD,
--          User Stories, and UAT phases of a real migration
-- ============================================================


-- ============================================================
-- PHASE 1: BRD — BUSINESS REQUIREMENTS
-- Business Problem: The legacy on-premise customer database
-- contains duplicate, incomplete, and unvalidated records.
-- Before migration to the cloud CRM, all data must be
-- profiled, cleansed, and validated to ensure data integrity.
-- ============================================================


-- BRD-SQL-001
-- Business Requirement: Identify all customer records with
-- missing mandatory fields before migrating to cloud CRM.
-- Raised by: Data Governance Team
-- Priority: Must Have
-- ============================================================
SELECT
    customer_id,
    first_name,
    last_name,
    email_address,
    phone_number,
    account_type,
    date_of_birth,
    CASE
        WHEN first_name IS NULL OR first_name = ''
            THEN 'FAIL — Missing First Name'
        WHEN last_name IS NULL OR last_name = ''
            THEN 'FAIL — Missing Last Name'
        WHEN email_address IS NULL OR email_address = ''
            THEN 'FAIL — Missing Email Address'
        WHEN phone_number IS NULL OR phone_number = ''
            THEN 'FAIL — Missing Phone Number'
        WHEN date_of_birth IS NULL
            THEN 'FAIL — Missing Date of Birth'
        ELSE 'PASS — Record Complete'
    END AS data_quality_status,
    CASE
        WHEN first_name IS NULL OR first_name = ''
          OR last_name IS NULL OR last_name = ''
          OR email_address IS NULL OR email_address = ''
          OR phone_number IS NULL OR phone_number = ''
          OR date_of_birth IS NULL
            THEN 'EXCLUDE FROM MIGRATION'
        ELSE 'APPROVED FOR MIGRATION'
    END AS migration_eligibility
FROM
    legacy_customer_master
WHERE
    record_status = 'Active'
ORDER BY
    migration_eligibility ASC,
    customer_id ASC;


-- BRD-SQL-002
-- Business Requirement: Profile the volume of records by
-- account type to support migration planning and resource
-- estimation for the project steering committee.
-- Raised by: Project Sponsor
-- Priority: Must Have
-- ============================================================
SELECT
    account_type,
    COUNT(customer_id) AS total_records,
    SUM(CASE WHEN record_status = 'Active' THEN 1 ELSE 0 END)
        AS active_records,
    SUM(CASE WHEN record_status = 'Inactive' THEN 1 ELSE 0 END)
        AS inactive_records,
    SUM(CASE WHEN record_status = 'Suspended' THEN 1 ELSE 0 END)
        AS suspended_records,
    ROUND(
        COUNT(customer_id) * 100.0 /
        SUM(COUNT(customer_id)) OVER (), 2
    ) AS percentage_of_total
FROM
    legacy_customer_master
GROUP BY
    account_type
ORDER BY
    total_records DESC;


-- ============================================================
-- PHASE 2: FRD — FUNCTIONAL REQUIREMENTS
-- Functional Specification: The migration engine must map
-- all source fields from the legacy system to the target
-- cloud CRM schema. All transformations must be documented
-- and validated prior to production load.
-- ============================================================


-- FRD-SQL-001
-- Functional Requirement FR-005: Validate field-level
-- mapping between legacy source system and target CRM.
-- Identifies any records where field lengths exceed the
-- target system constraints defined in the data dictionary.
-- ============================================================
SELECT
    customer_id,
    first_name,
    LENGTH(first_name) AS first_name_length,
    last_name,
    LENGTH(last_name) AS last_name_length,
    email_address,
    LENGTH(email_address) AS email_length,
    phone_number,
    LENGTH(phone_number) AS phone_length,
    CASE
        WHEN LENGTH(first_name) > 50
            THEN 'FAIL — First Name exceeds 50 characters'
        WHEN LENGTH(last_name) > 50
            THEN 'FAIL — Last Name exceeds 50 characters'
        WHEN LENGTH(email_address) > 100
            THEN 'FAIL — Email exceeds 100 characters'
        WHEN LENGTH(phone_number) > 15
            THEN 'FAIL — Phone exceeds 15 characters'
        ELSE 'PASS — Within field length constraints'
    END AS field_length_validation
FROM
    legacy_customer_master
WHERE
    LENGTH(first_name) > 50
    OR LENGTH(last_name) > 50
    OR LENGTH(email_address) > 100
    OR LENGTH(phone_number) > 15
ORDER BY
    customer_id ASC;


-- FRD-SQL-002
-- Functional Requirement FR-009: Detect and flag duplicate
-- customer records in the source system based on email
-- address before migration. Duplicate records must be
-- reviewed by the Data Steward before migration approval.
-- ============================================================
SELECT
    email_address,
    COUNT(customer_id) AS duplicate_count,
    MIN(customer_id) AS oldest_record_id,
    MAX(customer_id) AS newest_record_id,
    MIN(created_date) AS first_created,
    MAX(created_date) AS last_created,
    CASE
        WHEN COUNT(customer_id) = 2
            THEN 'REVIEW — 2 duplicates found'
        WHEN COUNT(customer_id) = 3
            THEN 'ESCALATE — 3 duplicates found'
        WHEN COUNT(customer_id) > 3
            THEN 'CRITICAL — More than 3 duplicates'
        ELSE 'CLEAN'
    END AS duplicate_severity
FROM
    legacy_customer_master
WHERE
    record_status = 'Active'
GROUP BY
    email_address
HAVING
    COUNT(customer_id) > 1
ORDER BY
    duplicate_count DESC;


-- FRD-SQL-003
-- Functional Requirement FR-012: Map and validate account
-- balance data between source and target systems post-load.
-- Any variance greater than $0.01 must be investigated
-- and resolved before production sign-off.
-- ============================================================
SELECT
    source_accounts.account_id,
    source_accounts.customer_id,
    source_accounts.account_balance AS source_balance,
    target_accounts.account_balance AS target_balance,
    source_accounts.account_balance
        - target_accounts.account_balance AS balance_variance,
    CASE
        WHEN ABS(source_accounts.account_balance
            - target_accounts.account_balance) = 0
            THEN 'PASS — Balances match exactly'
        WHEN ABS(source_accounts.account_balance
            - target_accounts.account_balance) <= 0.01
            THEN 'REVIEW — Minor rounding variance'
        WHEN ABS(source_accounts.account_balance
            - target_accounts.account_balance) > 0.01
            THEN 'FAIL — Variance exceeds tolerance'
    END AS reconciliation_status
FROM
    source_accounts
LEFT JOIN
    target_accounts
    ON source_accounts.account_id = target_accounts.account_id
ORDER BY
    ABS(source_accounts.account_balance
        - target_accounts.account_balance) DESC;


-- ============================================================
-- PHASE 3: USER STORIES — SPRINT DELIVERY
-- Sprint 4 Goal: Validate migrated customer data in the
-- target CRM and confirm all records are accessible,
-- accurate, and correctly mapped for business use.
-- ============================================================


-- US-001: As a Sales Manager, I want to see all successfully
-- migrated active customers in the new CRM so that I can
-- begin outreach activities without interruption.
-- Acceptance Criteria: All active records from source must
-- exist in target with matching key fields.
-- ============================================================
SELECT
    legacy_customer_master.customer_id,
    legacy_customer_master.first_name,
    legacy_customer_master.last_name,
    legacy_customer_master.email_address,
    CASE
        WHEN target_crm_customers.customer_id IS NOT NULL
            THEN 'MIGRATED SUCCESSFULLY'
        ELSE 'MISSING FROM TARGET — MIGRATION FAILED'
    END AS migration_status
FROM
    legacy_customer_master
LEFT JOIN
    target_crm_customers
    ON legacy_customer_master.customer_id
        = target_crm_customers.customer_id
WHERE
    legacy_customer_master.record_status = 'Active'
ORDER BY
    migration_status ASC,
    legacy_customer_master.customer_id ASC;


-- US-002: As a Risk Manager, I want all high-value accounts
-- over $500,000 balance to be flagged and reviewed before
-- migration sign-off so that no critical accounts are lost
-- or incorrectly mapped during the migration process.
-- ============================================================
SELECT
    source_accounts.account_id,
    legacy_customer_master.first_name,
    legacy_customer_master.last_name,
    legacy_customer_master.email_address,
    source_accounts.account_balance,
    source_accounts.account_type,
    CASE
        WHEN source_accounts.account_balance >= 1000000
            THEN 'TIER 1 — Executive review required'
        WHEN source_accounts.account_balance >= 500000
            THEN 'TIER 2 — Senior review required'
        WHEN source_accounts.account_balance >= 100000
            THEN 'TIER 3 — Standard review required'
        ELSE 'STANDARD — No special review needed'
    END AS review_tier,
    CASE
        WHEN target_accounts.account_id IS NOT NULL
            THEN 'CONFIRMED IN TARGET'
        ELSE 'NOT FOUND IN TARGET — ACTION REQUIRED'
    END AS target_verification_status
FROM
    source_accounts
JOIN
    legacy_customer_master
    ON source_accounts.customer_id
        = legacy_customer_master.customer_id
LEFT JOIN
    target_accounts
    ON source_accounts.account_id
        = target_accounts.account_id
WHERE
    source_accounts.account_balance >= 100000
ORDER BY
    source_accounts.account_balance DESC;


-- US-003: As a Data Analyst, I want a record count
-- comparison between the source and target systems grouped
-- by account type so that I can confirm migration
-- completeness before UAT sign-off.
-- ============================================================
SELECT
    'Source System — Legacy On-Premise' AS system_name,
    account_type,
    COUNT(account_id) AS total_records,
    SUM(account_balance) AS total_balance,
    AVG(account_balance) AS average_balance
FROM
    source_accounts
GROUP BY
    account_type

UNION ALL

SELECT
    'Target System — Cloud CRM' AS system_name,
    account_type,
    COUNT(account_id) AS total_records,
    SUM(account_balance) AS total_balance,
    AVG(account_balance) AS average_balance
FROM
    target_accounts
GROUP BY
    account_type

ORDER BY
    account_type ASC,
    system_name ASC;


-- ============================================================
-- PHASE 4: UAT — USER ACCEPTANCE TESTING
-- UAT Sprint: Sprint 5 — Data Migration Validation
-- BA Owner: Mohan Sarath Ayinabathini
-- UAT Coordinator: Business Stakeholders + Data Team
-- ============================================================


-- UAT-TC-001
-- Test Case: Verify total record count matches between
-- source and target after full migration load.
-- Expected Result: Source count = Target count
-- Pass Criteria: Zero variance in record counts
-- ============================================================
SELECT
    source_summary.total_source_records,
    target_summary.total_target_records,
    source_summary.total_source_records
        - target_summary.total_target_records AS record_variance,
    CASE
        WHEN source_summary.total_source_records
            = target_summary.total_target_records
            THEN 'UAT PASS — Record counts match'
        ELSE 'UAT FAIL — Record count mismatch detected'
    END AS test_result
FROM
    (SELECT COUNT(customer_id) AS total_source_records
     FROM legacy_customer_master
     WHERE record_status = 'Active') AS source_summary,
    (SELECT COUNT(customer_id) AS total_target_records
     FROM target_crm_customers
     WHERE record_status = 'Active') AS target_summary;


-- UAT-TC-002
-- Test Case: Verify all mandatory fields are populated
-- correctly in the target CRM after migration.
-- Expected Result: Zero records with null mandatory fields
-- Pass Criteria: All migrated records pass field validation
-- ============================================================
SELECT
    customer_id,
    first_name,
    last_name,
    email_address,
    phone_number,
    account_type,
    migration_date,
    CASE
        WHEN first_name IS NULL OR first_name = ''
            THEN 'UAT FAIL — First Name missing in target'
        WHEN last_name IS NULL OR last_name = ''
            THEN 'UAT FAIL — Last Name missing in target'
        WHEN email_address IS NULL OR email_address = ''
            THEN 'UAT FAIL — Email missing in target'
        WHEN phone_number IS NULL OR phone_number = ''
            THEN 'UAT FAIL — Phone missing in target'
        WHEN account_type IS NULL OR account_type = ''
            THEN 'UAT FAIL — Account Type missing in target'
        ELSE 'UAT PASS — All mandatory fields populated'
    END AS uat_field_validation_result
FROM
    target_crm_customers
WHERE
    first_name IS NULL
    OR last_name IS NULL
    OR email_address IS NULL
    OR phone_number IS NULL
    OR account_type IS NULL
ORDER BY
    customer_id ASC;


-- UAT-TC-003
-- Test Case: Generate final UAT sign-off summary report
-- showing pass rate by test category for stakeholder review.
-- Expected Result: Overall pass rate >= 95%
-- Stakeholders: Product Owner, Data Governance, IT Lead
-- ============================================================
SELECT
    test_category,
    COUNT(test_case_id) AS total_test_cases,
    SUM(CASE WHEN test_result = 'Pass' THEN 1 ELSE 0 END)
        AS passed,
    SUM(CASE WHEN test_result = 'Fail' THEN 1 ELSE 0 END)
        AS failed,
    SUM(CASE WHEN test_result = 'Blocked' THEN 1 ELSE 0 END)
        AS blocked,
    ROUND(
        SUM(CASE WHEN test_result = 'Pass' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(test_case_id), 2
    ) AS pass_rate_percentage,
    CASE
        WHEN ROUND(
            SUM(CASE WHEN test_result = 'Pass' THEN 1 ELSE 0 END)
            * 100.0 / COUNT(test_case_id), 2) >= 95
            THEN 'APPROVED FOR SIGN-OFF'
        WHEN ROUND(
            SUM(CASE WHEN test_result = 'Pass' THEN 1 ELSE 0 END)
            * 100.0 / COUNT(test_case_id), 2) >= 80
            THEN 'CONDITIONAL APPROVAL — Review failures'
        ELSE 'NOT APPROVED — Re-testing required'
    END AS sign_off_recommendation
FROM
    uat_test_cases
WHERE
    sprint_id = 'SPRINT-05'
    AND project_name = 'On-Premise to Cloud Migration'
GROUP BY
    test_category
ORDER BY
    pass_rate_percentage ASC;

