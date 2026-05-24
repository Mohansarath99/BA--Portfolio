-- ============================================================
-- SQL SAMPLES — Business Analyst Portfolio
-- Author: Mohan Sarath Ayinabathini
-- Domain: Banking & Financial Services
-- Purpose: Data Analysis, Validation & Reporting
-- ============================================================


-- ============================================================
-- 1. DATA VALIDATION — Check for missing mandatory fields
--    Use case: Validate incoming customer records before load
-- ============================================================
SELECT
    customer_id,
    first_name,
    last_name,
    email,
    phone,
    CASE
        WHEN first_name IS NULL OR first_name = '' THEN 'Missing First Name'
        WHEN last_name IS NULL OR last_name = '' THEN 'Missing Last Name'
        WHEN email IS NULL OR email = '' THEN 'Missing Email'
        WHEN phone IS NULL OR phone = '' THEN 'Missing Phone'
        ELSE 'Valid'
    END AS validation_status
FROM
    customers
WHERE
    first_name IS NULL
    OR last_name IS NULL
    OR email IS NULL
    OR phone IS NULL;


-- ============================================================
-- 2. DUPLICATE DETECTION — Find duplicate customer records
--    Use case: Data quality check before CRM migration
-- ============================================================
SELECT
    email,
    COUNT(*) AS duplicate_count
FROM
    customers
GROUP BY
    email
HAVING
    COUNT(*) > 1
ORDER BY
    duplicate_count DESC;


-- ============================================================
-- 3. LEAD CONVERSION REPORT — Monthly lead funnel analysis
--    Use case: Sales performance reporting for management
-- ============================================================
SELECT
    DATE_FORMAT(created_date, '%Y-%m') AS month,
    COUNT(*) AS total_leads,
    SUM(CASE WHEN status = 'Converted' THEN 1 ELSE 0 END) AS converted_leads,
    SUM(CASE WHEN status = 'Lost' THEN 1 ELSE 0 END) AS lost_leads,
    SUM(CASE WHEN status = 'Open' THEN 1 ELSE 0 END) AS open_leads,
    ROUND(
        SUM(CASE WHEN status = 'Converted' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS conversion_rate_pct
FROM
    leads
WHERE
    created_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY
    DATE_FORMAT(created_date, '%Y-%m')
ORDER BY
    month DESC;


-- ============================================================
-- 4. RISK EXPOSURE REPORT — Accounts exceeding credit limit
--    Use case: Risk management reporting at Citi Group
-- ============================================================
SELECT
    a.account_id,
    a.account_name,
    a.credit_limit,
    a.current_balance,
    a.current_balance - a.credit_limit AS over_limit_amount,
    ROUND((a.current_balance / a.credit_limit) * 100, 2) AS utilization_pct,
    r.risk_rating
FROM
    accounts a
JOIN
    risk_ratings r ON a.account_id = r.account_id
WHERE
    a.current_balance > a.credit_limit
ORDER BY
    over_limit_amount DESC;


-- ============================================================
-- 5. UAT DEFECT SUMMARY — Test case results by module
--    Use case: UAT reporting during system implementation
-- ============================================================
SELECT
    module_name,
    COUNT(*) AS total_test_cases,
    SUM(CASE WHEN result = 'Pass' THEN 1 ELSE 0 END) AS passed,
    SUM(CASE WHEN result = 'Fail' THEN 1 ELSE 0 END) AS failed,
    SUM(CASE WHEN result = 'Blocked' THEN 1 ELSE 0 END) AS blocked,
    ROUND(
        SUM(CASE WHEN result = 'Pass' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS pass_rate_pct
FROM
    test_cases
WHERE
    sprint_id = 'SPRINT-03'
GROUP BY
    module_name
ORDER BY
    pass_rate_pct ASC;


-- ============================================================
-- 6. STAKEHOLDER ACTIVITY LOG — Track engagement frequency
--    Use case: Stakeholder management reporting
-- ============================================================
SELECT
    s.stakeholder_name,
    s.role,
    s.department,
    COUNT(e.engagement_id) AS total_engagements,
    MAX(e.engagement_date) AS last_engaged,
    DATEDIFF(CURDATE(), MAX(e.engagement_date)) AS days_since_last_contact
FROM
    stakeholders s
LEFT JOIN
    engagements e ON s.stakeholder_id = e.stakeholder_id
GROUP BY
    s.stakeholder_id,
    s.stakeholder_name,
    s.role,
    s.department
ORDER BY
    days_since_last_contact DESC;


-- ============================================================
-- 7. DATA RECONCILIATION — Compare source vs target counts
--    Use case: Post-migration data validation
-- ============================================================
SELECT
    'Source System' AS system_name,
    COUNT(*) AS record_count,
    SUM(balance) AS total_balance
FROM source_accounts
UNION ALL
SELECT
    'Target System' AS system_name,
    COUNT(*) AS record_count,
    SUM(balance) AS total_balance
FROM target_accounts;


-- ============================================================
-- 8. MONTHLY REPORTING — Revenue by product line
--    Use case: Executive reporting dashboard feed
-- ============================================================
SELECT
    p.product_category,
    p.product_name,
    DATE_FORMAT(t.transaction_date, '%Y-%m') AS month,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(t.amount) AS total_revenue,
    AVG(t.amount) AS avg_transaction_value,
    MIN(t.amount) AS min_transaction,
    MAX(t.amount) AS max_transaction
FROM
    transactions t
JOIN
    products p ON t.product_id = p.product_id
WHERE
    t.transaction_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
    AND t.status = 'Completed'
GROUP BY
    p.product_category,
    p.product_name,
    DATE_FORMAT(t.transaction_date, '%Y-%m')
ORDER BY
    month DESC,
    total_revenue DESC;


-- ============================================================
-- 9. GAP ANALYSIS — Requirements coverage check
--    Use case: Ensure all requirements have test cases
-- ============================================================
SELECT
    r.requirement_id,
    r.requirement_description,
    r.priority,
    COUNT(t.test_case_id) AS test_case_count,
    CASE
        WHEN COUNT(t.test_case_id) = 0 THEN 'NO TEST COVERAGE — GAP IDENTIFIED'
        WHEN COUNT(t.test_case_id) < 2 THEN 'LOW COVERAGE'
        ELSE 'ADEQUATE COVERAGE'
    END AS coverage_status
FROM
    requirements r
LEFT JOIN
    test_cases t ON r.requirement_id = t.requirement_id
GROUP BY
    r.requirement_id,
    r.requirement_description,
    r.priority
ORDER BY
    test_case_count ASC;


-- ============================================================
-- 10. SLA COMPLIANCE REPORT — Issue resolution tracking
--     Use case: Operational reporting for service management
-- ============================================================
SELECT
    priority,
    COUNT(*) AS total_issues,
    AVG(DATEDIFF(resolved_date, created_date)) AS avg_resolution_days,
    SUM(
        CASE
            WHEN priority = 'Critical' AND DATEDIFF(resolved_date, created_date) <= 1 THEN 1
            WHEN priority = 'High' AND DATEDIFF(resolved_date, created_date) <= 3 THEN 1
            WHEN priority = 'Medium' AND DATEDIFF(resolved_date, created_date) <= 7 THEN 1
            WHEN priority = 'Low' AND DATEDIFF(resolved_date, created_date) <= 14 THEN 1
            ELSE 0
        END
    ) AS within_sla,
    ROUND(
        SUM(
            CASE
                WHEN priority = 'Critical' AND DATEDIFF(resolved_date, created_date) <= 1 THEN 1
                WHEN priority = 'High' AND DATEDIFF(resolved_date, created_date) <= 3 THEN 1
                WHEN priority = 'Medium' AND DATEDIFF(resolved_date, created_date) <= 7 THEN 1
                WHEN priority = 'Low' AND DATEDIFF(resolved_date, created_date) <= 14 THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*), 2
    ) AS sla_compliance_pct
FROM
    issues
WHERE
    resolved_date IS NOT NULL
    AND created_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY
    priority
ORDER BY
    FIELD(priority, 'Critical', 'High', 'Medium', 'Low');
