
INSERT INTO departments (dept_name)
VALUES('Cardiology'),
('Neurology'),
('Orthopedics'),
('Pediatrics'),
('General Medicine');


INSERT INTO doctors (doctor_name, specialization, dept_id, phone, email) VALUES
('Dr. Amit Sharma', 'Heart Specialist', 1, '9876543210', 'amit@hospital.com'),
('Dr. Neha Verma', 'Brain Specialist', 2, '9876543220', 'neha@hospital.com'),
('Dr. Rahul Patil', 'Bone Specialist', 3, '9876543230', 'rahul@hospital.com'),
('Dr. Pooja Mehta', 'Child Specialist', 4, '9876543240', 'pooja@hospital.com'),
('Dr. Sanjay Kulkarni', 'Physician', 5, '9876543250', 'sanjay@hospital.com'),
('Dr. Anjali Desai', 'Cardiologist', 1, '9876543260', 'anjali@hospital.com'),
('Dr. Karan Joshi', 'Neurosurgeon', 2, '9876543270', 'karan@hospital.com'),
('Dr. Sneha Rao', 'Orthopedic Surgeon', 3, '9876543280', 'sneha@hospital.com'),
('Dr. Ritu Malhotra', 'Pediatrician', 4, '9876543290', 'ritu@hospital.com'),
('Dr. Vikram Singh', 'General Physician', 5, '9876543300', 'vikram@hospital.com');



INSERT INTO patients (patient_name, gender, dob, phone, city) VALUES
('Aarav Shah', 'Male', '1995-03-15', '9000011111', 'Mumbai'),
('Riya Patel', 'Female', '1998-07-21', '9000022222', 'Pune'),
('Mohit Verma', 'Male', '1987-11-02', '9000033333', 'Delhi'),
('Sneha Nair', 'Female', '2000-01-10', '9000044444', 'Bangalore'),
('Rahul Gupta', 'Male', '1992-05-05', '9000055555', 'Indore'),
('Ananya Joshi', 'Female', '1999-09-09', '9000066666', 'Nagpur'),
('Kunal Mehta', 'Male', '1985-12-19', '9000077777', 'Surat'),
('Pooja Iyer', 'Female', '1994-02-22', '9000088888', 'Chennai'),
('Rohan Kulkarni', 'Male', '1991-06-14', '9000099999', 'Kolhapur'),
('Neelam Kapoor', 'Female', '1989-08-30', '9000000000', 'Jaipur');


INSERT INTO appointments (patient_id, doctor_id, appointment_date, STATUS) VALUES
(1, 1, '2025-02-01', 'Completed'),
(2, 2, '2025-02-01', 'Completed'),
(3, 3, '2025-02-02', 'Completed'),
(4, 4, '2025-02-02', 'Completed'),
(5, 5, '2025-02-03', 'Completed'),
(6, 6, '2025-02-03', 'Completed'),
(7, 7, '2025-02-04', 'Completed'),
(8, 8, '2025-02-04', 'Completed'),
(9, 9, '2025-02-05', 'Completed'),
(10,10,'2025-02-05','Completed'),

(1, 3, '2025-02-06', 'Completed'),
(2, 4, '2025-02-06', 'Completed'),
(3, 5, '2025-02-07', 'Completed'),
(4, 6, '2025-02-07', 'Completed'),
(5, 7, '2025-02-08', 'Completed'),
(6, 8, '2025-02-08', 'Completed'),
(7, 9, '2025-02-09', 'Completed'),
(8,10,'2025-02-09','Completed'),
(9, 1, '2025-02-10', 'Completed'),
(10,2,'2025-02-10','Completed');


INSERT INTO medicines (medicine_name, price) VALUES
('Paracetamol', 50),
('Amoxicillin', 120),
('Crocin', 60),
('Azithromycin', 150),
('Vitamin D3', 90),
('Calcium Tablets', 80),
('Cough Syrup', 110),
('Insulin', 250),
('Pain Relief Gel', 70),
('Antacid', 40);



INSERT INTO prescriptions (appointment_id, medicine_id, quantity) VALUES
(1,1,2),(1,3,1),
(2,2,2),(2,5,1),
(3,6,1),(3,9,1),
(4,1,1),(4,7,1),
(5,10,2),(5,3,1),
(6,2,1),(6,8,1),
(7,4,2),(7,6,1),
(8,9,2),(8,1,1),
(9,5,1),(9,7,1),
(10,3,2),(10,10,1);


INSERT INTO billing 
(appointment_id, consultation_fee, lab_fee, medicine_fee, total_amount, bill_date) VALUES
(1,500,300,200,1000,'2025-02-01'),
(2,600,200,250,1050,'2025-02-01'),
(3,400,150,180,730,'2025-02-02'),
(4,500,100,160,760,'2025-02-02'),
(5,450,120,140,710,'2025-02-03'),
(6,700,300,350,1350,'2025-02-03'),
(7,800,400,300,1500,'2025-02-04'),
(8,500,200,220,920,'2025-02-04'),
(9,600,150,180,930,'2025-02-05'),
(10,550,100,120,770,'2025-02-05'),

(11,450,200,190,840,'2025-02-06'),
(12,500,150,210,860,'2025-02-06'),
(13,600,250,200,1050,'2025-02-07'),
(14,700,300,260,1260,'2025-02-07'),
(15,650,200,230,1080,'2025-02-08'),
(16,550,150,190,890,'2025-02-08'),
(17,500,100,160,760,'2025-02-09'),
(18,600,200,240,1040,'2025-02-09'),
(19,750,300,350,1400,'2025-02-10'),
(20,650,250,260,1160,'2025-02-10');



INSERT INTO payments (bill_id, payment_mode, payment_date, amount) VALUES
(1,'Cash','2025-02-01',1000),
(2,'Card','2025-02-01',1050),
(3,'UPI','2025-02-02',730),
(4,'Cash','2025-02-02',760),
(5,'UPI','2025-02-03',710),
(6,'Card','2025-02-03',1350),
(7,'UPI','2025-02-04',1500),
(8,'Cash','2025-02-04',920),
(9,'Card','2025-02-05',930),
(10,'UPI','2025-02-05',770),

(11,'Cash','2025-02-06',840),
(12,'UPI','2025-02-06',860),
(13,'Card','2025-02-07',1050),
(14,'UPI','2025-02-07',1260),
(15,'Cash','2025-02-08',1080),
(16,'UPI','2025-02-08',890),
(17,'Cash','2025-02-09',760),
(18,'Card','2025-02-09',1040),
(19,'UPI','2025-02-10',1400),
(20,'Card','2025-02-10',1160);


