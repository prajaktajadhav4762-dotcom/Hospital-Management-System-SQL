CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_name VARCHAR(100),
    specialization VARCHAR(100),
    dept_id INT,
    phone VARCHAR(15),
    email VARCHAR(100),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(100),
    gender ENUM('Male','Female','Other'),
    dob DATE,
    phone VARCHAR(15),
    city VARCHAR(50)
);


CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    STATUS ENUM('Scheduled','Completed','Cancelled'),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);


CREATE TABLE medicines (
    medicine_id INT PRIMARY KEY AUTO_INCREMENT,
    medicine_name VARCHAR(100),
    price DECIMAL(10,2)
);


CREATE TABLE prescriptions (
    prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT,
    medicine_id INT,
    quantity INT,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id),
    FOREIGN KEY (medicine_id) REFERENCES medicines(medicine_id)
);


 CREATE TABLE billing (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT,
    consultation_fee DECIMAL(10,2),
    lab_fee DECIMAL(10,2),
    medicine_fee DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    bill_date DATE,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);


CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    bill_id INT,
    payment_mode ENUM('Cash','Card','UPI'),
    payment_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (bill_id) REFERENCES billing(bill_id)
);
