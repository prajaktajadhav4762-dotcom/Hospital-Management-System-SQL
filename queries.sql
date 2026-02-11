
--HOSPITAL MANAGEMENT SYSTEM - ANALYTICAL QUERIES--

-- View all patients--
SELECT * FROM patients;

-- Total number of doctors--
SELECT COUNT(*) AS total_doctors
FROM doctors;

-- Doctor names with specialization--
SELECT doctor_name, specialization
FROM doctors;

-- Total number of appointments--
SELECT COUNT(*) AS total_appointments
FROM appointments;


--AGGREGATE QUERIES--
  

-- Total hospital revenue--
SELECT SUM(total_amount) AS total_revenue
FROM billing;

-- Department-wise doctor count--
SELECT dep.dept_name,
       COUNT(d.doctor_id) AS doctor_count
FROM departments dep
LEFT JOIN doctors d ON dep.dept_id = d.dept_id
GROUP BY dep.dept_name;

-- Department-wise revenue--
SELECT dep.dept_name,
       SUM(b.total_amount) AS revenue
FROM departments dep
JOIN doctors d ON dep.dept_id = d.dept_id
JOIN appointments a ON d.doctor_id = a.doctor_id
JOIN billing b ON a.appointment_id = b.appointment_id
GROUP BY dep.dept_name;

-- Doctor-wise total revenue--
SELECT d.doctor_name,
       SUM(b.total_amount) AS revenue
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
JOIN billing b ON a.appointment_id = b.appointment_id
GROUP BY d.doctor_name;


--JOIN QUERIES--
 

-- Patient appointment details--
SELECT p.patient_name,
       d.doctor_name,
       a.appointment_date
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;

-- Doctors with no appointments--
SELECT d.doctor_name
FROM doctors d
LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
WHERE a.appointment_id IS NULL;

-- Patients with multiple visits--
SELECT p.patient_name,
       COUNT(a.appointment_id) AS visits
FROM patients p
JOIN appointments a ON p.patient_id = a.patient_id
GROUP BY p.patient_name
HAVING COUNT(a.appointment_id) > 1;


--VIEW CREATION--
  

-- Create view for doctor revenue--
CREATE VIEW doctor_revenue AS
SELECT d.doctor_name,
       SUM(b.total_amount) AS revenue
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
JOIN billing b ON a.appointment_id = b.appointment_id
GROUP BY d.doctor_name;

-- View doctor revenue--
SELECT * FROM doctor_revenue;



   --SUBQUERY EXAMPLES--

-- Highest earning doctor--
SELECT doctor_name
FROM doctor_revenue
WHERE revenue = (SELECT MAX(revenue) FROM doctor_revenue);

-- Doctors earning above average revenue--
SELECT doctor_name, revenue
FROM doctor_revenue
WHERE revenue > (SELECT AVG(revenue) FROM doctor_revenue);

-- Departments earning more than average--
SELECT dept_name, revenue
FROM (
    SELECT dep.dept_name,
           SUM(b.total_amount) AS revenue
    FROM departments dep
    JOIN doctors d ON dep.dept_id = d.dept_id
    JOIN appointments a ON d.doctor_id = a.doctor_id
    JOIN billing b ON a.appointment_id = b.appointment_id
    GROUP BY dep.dept_name
) t
WHERE revenue > (
    SELECT AVG(revenue)
    FROM (
        SELECT SUM(total_amount) AS revenue
        FROM billing
        GROUP BY bill_date
    ) x
);



 --WINDOW FUNCTIONS--
  

-- Rank doctors by revenue--
SELECT doctor_name,
       revenue,
       RANK() OVER (ORDER BY revenue DESC) AS rank_position
FROM doctor_revenue;

-- Top 3 earning doctors--
SELECT *
FROM (
    SELECT doctor_name,
           revenue,
           DENSE_RANK() OVER (ORDER BY revenue DESC) AS rnk
    FROM doctor_revenue
) t
WHERE rnk <= 3;

-- Second highest earning doctor--
SELECT doctor_name, revenue
FROM (
    SELECT doctor_name,
           revenue,
           RANK() OVER (ORDER BY revenue DESC) AS rnk
    FROM doctor_revenue
) t
WHERE rnk = 2;



  --DATE-BASED ANALYSIS--


-- Daily revenue--
SELECT bill_date,
       SUM(total_amount) AS daily_revenue
FROM billing
GROUP BY bill_date;

-- Monthly revenue--
SELECT MONTH(bill_date) AS month,
       SUM(total_amount) AS revenue
FROM billing
GROUP BY MONTH(bill_date);



  --CASE STATEMENT--
   

-- Categorize doctors based on revenue--
SELECT doctor_name,
       revenue,
       CASE
           WHEN revenue > 2000 THEN 'High'
           WHEN revenue > 1000 THEN 'Medium'
           ELSE 'Low'
       END AS revenue_category
FROM doctor_revenue;



 --CTE (COMMON TABLE EXPRESSION)--


WITH dept_revenue AS (
    SELECT dep.dept_name,
           SUM(b.total_amount) AS revenue
    FROM departments dep
    JOIN doctors d ON dep.dept_id = d.dept_id
    JOIN appointments a ON d.doctor_id = a.doctor_id
    JOIN billing b ON a.appointment_id = b.appointment_id
    GROUP BY dep.dept_name
)
SELECT * FROM dept_revenue;


  --INDEX CREATION--
   

-- Create index for faster patient-based search--
CREATE INDEX idx_patient_id
ON appointments(patient_id);
