# Sanskar Mavani
# A00319026

# Fetching Data from a Single Table 

-- 1.Basic SELECT Statement: Fetching all columns from the vendors table
SELECT * FROM vendors
ORDER BY vendor_id;

-- 2. WHERE Clause: Filtering vendors located in the state of 'CA'
SELECT vendor_name, vendor_phone, vendor_city 
FROM vendors 
WHERE vendor_state = 'CA' -- Only selecting vendors from California
ORDER BY vendor_name; -- Sorting results alphabetically by vendor_name

-- 3. Sorting Results: Fetching invoices sorted by invoice_total in descending order
SELECT invoice_id, invoice_total, invoice_date 
FROM invoices
ORDER BY invoice_total DESC; -- Higher invoice_total values appear first

-- 4. Limiting Results: Fetching invoices ranked 3rd to 9th by the lowest invoice_total
SELECT invoice_id, invoice_total
FROM invoices
ORDER BY invoice_total -- Ordering in ascending order to get lowest values first
LIMIT 6 OFFSET 2; -- Skipping the first 2 rows and retrieving the next 6 rows

-- 5. Using Arithmetic: Calculating Remaining Balance (invoice_total - payment_total)
SELECT invoice_id, invoice_total, (invoice_total - payment_total) AS Remaining_Balance
FROM invoices
ORDER BY invoice_id; -- Sorting by invoice_id for better readability

-- Fetching Data from Multiple Tables

-- 6. Inner Join: Joining invoices with vendors to get vendor details for each invoice
SELECT invoices.invoice_id, invoices.invoice_total, vendors.vendor_name, vendors.vendor_phone
FROM invoices
INNER JOIN vendors ON invoices.vendor_id = vendors.vendor_id -- Matching vendors with invoices based on vendor_id
ORDER BY invoices.invoice_id; -- Sorting by invoice_id

-- 7. Outer Join: Fetching all vendors including those without invoices
SELECT vendors.vendor_name, invoices.invoice_id
FROM vendors
LEFT JOIN invoices ON vendors.vendor_id = invoices.vendor_id -- Includes vendors who have no corresponding invoices
ORDER BY vendors.vendor_name; -- Sorting results alphabetically by vendor_name

-- 8. Outer Join 2: Fetching all departments with their employees (even those without a department)
SELECT departments.department_name, employees.last_name
FROM departments
LEFT JOIN employees ON departments.department_id = employees.department_id -- Including departments even if no employees are assigned
ORDER BY departments.department_id; -- Sorting by department_id

-- 9. Using CONCAT: Combining first_name and last_name into a single column
SELECT CONCAT(vendor_contacts.first_name, ' ', vendor_contacts.last_name) AS Combined_Contact_Name, vendors.vendor_name
FROM vendor_contacts
JOIN vendors ON vendor_contacts.vendor_id = vendors.vendor_id -- Joining vendor_contacts with vendors table
ORDER BY Combined_Contact_Name; -- Sorting by the combined contact name

-- 10. UNION: Fetching unique first names from both employees and sales_reps tables
SELECT first_name
FROM employees
UNION -- Removes duplicates automatically
SELECT first_name
FROM sales_reps
ORDER BY first_name; -- Sorting the combined result alphabetically

-- 11. Complex Query with Multiple Joins: Fetching invoice details along with vendor and terms information
SELECT invoices.invoice_id, invoices.invoice_total, vendors.vendor_name, terms.terms_description
FROM invoices
JOIN vendors ON invoices.vendor_id = vendors.vendor_id -- Joining invoices with vendors
JOIN terms ON invoices.terms_id = terms.terms_id -- Joining invoices with terms
ORDER BY invoices.invoice_id; -- Sorting by invoice_id
