CREATE DATABASE hospital_db;


USE hospital_db;



CREATE TABLE Hospital (
    hospital_id INT PRIMARY KEY,
    hospital_name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE
);



CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    hospital_id INT,

    FOREIGN KEY (hospital_id)
        REFERENCES Hospital(hospital_id)
);


CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE,
    department_id INT,

    FOREIGN KEY (department_id)
        REFERENCES Department(department_id)
);



CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15),
    address VARCHAR(200),
    blood_group VARCHAR(5)
);



CREATE TABLE Records (
    record_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    admission_date DATE,
    discharge_date DATE,
    disease VARCHAR(150),
    diagnosis VARCHAR(200),
    treatment VARCHAR(200),

    FOREIGN KEY (patient_id)
        REFERENCES Patient(patient_id),

    FOREIGN KEY (doctor_id)
        REFERENCES Doctor(doctor_id)
);
-- Hospital
INSERT INTO Hospital
VALUES
(1, 'City Care Hospital', 'Mumbai', '9876543210', 'citycare@gmail.com'),
(2, 'Apollo Health Center', 'Pune', '9876543211', 'apollo@gmail.com');


-- Department
INSERT INTO Department
VALUES
(101, 'Cardiology', 'First Floor', 1),
(102, 'Neurology', 'Second Floor', 1),
(103, 'Orthopedics', 'Ground Floor', 2);


-- Doctor
INSERT INTO Doctor
VALUES
(201, 'Dr. Rahul Sharma', 'Cardiologist', '9000000001', 'rahul@gmail.com', 101),
(202, 'Dr. Priya Patel', 'Neurologist', '9000000002', 'priya@gmail.com', 102),
(203, 'Dr. Amit Verma', 'Orthopedic Surgeon', '9000000003', 'amit@gmail.com', 103);


-- Patient
INSERT INTO Patient
VALUES
(301, 'Aalok Rao', 20, 'Male', '9000000011', 'Mumbai', 'O+'),
(302, 'Riya Shah', 25, 'Female', '9000000012', 'Pune', 'A+'),
(303, 'Karan Mehta', 35, 'Male', '9000000013', 'Nashik', 'B+');


-- Records
INSERT INTO Records
VALUES
(401, 301, 201, '2026-08-01', '2026-08-05',
 'Chest Pain', 'Heart-related problem', 'Medication and observation'),

(402, 302, 202, '2026-08-03', '2026-08-07',
 'Headache', 'Migraine', 'Medication'),

(403, 303, 203, '2026-08-10', '2026-08-15',
 'Leg Pain', 'Fracture', 'Surgery and physiotherapy');
 SELECT * FROM Hospital;

SELECT * FROM Department;

SELECT * FROM Doctor;

SELECT * FROM Patient;

SELECT * FROM Records;



















