-- ESMS Portal Database Setup
-- Run this in your MySQL database (phpMyAdmin)

CREATE DATABASE IF NOT EXISTS esms_portal;
USE esms_portal;

-- Students table
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    roll_no VARCHAR(20) UNIQUE NOT NULL,
    enrollment_no VARCHAR(20) UNIQUE NOT NULL,
    branch VARCHAR(10) NOT NULL,
    year INT NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- HODs table
CREATE TABLE hods (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    branch VARCHAR(10) NOT NULL
);

-- Insert HOD data
INSERT INTO hods (username, name, branch) VALUES
('hodcm', 'Computer HOD', 'CM'),
('hodej', 'Electronics HOD', 'EJ'),
('hodme', 'Mechanical HOD', 'ME'),
('hodce', 'Civil HOD', 'CE'),
('hodai', 'AI HOD', 'AI'),
('hodee', 'Electrical HOD', 'EE'),
('hodit', 'IT HOD', 'IT');

-- Class Teachers table
CREATE TABLE class_teachers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    branch VARCHAR(10) NOT NULL,
    year INT NOT NULL
);

-- Insert Class Teachers data
INSERT INTO class_teachers (username, name, branch, year) VALUES
('CM1', 'Computer Year 1 Teacher', 'CM', 1),
('CM2', 'Computer Year 2 Teacher', 'CM', 2),
('CM3', 'Computer Year 3 Teacher', 'CM', 3),
('EJ1', 'Electronics Year 1 Teacher', 'EJ', 1),
('EJ2', 'Electronics Year 2 Teacher', 'EJ', 2),
('EJ3', 'Electronics Year 3 Teacher', 'EJ', 3),
('ME1', 'Mechanical Year 1 Teacher', 'ME', 1),
('ME2', 'Mechanical Year 2 Teacher', 'ME', 2),
('ME3', 'Mechanical Year 3 Teacher', 'ME', 3),
('CE1', 'Civil Year 1 Teacher', 'CE', 1),
('CE2', 'Civil Year 2 Teacher', 'CE', 2),
('CE3', 'Civil Year 3 Teacher', 'CE', 3),
('AI1', 'AI Year 1 Teacher', 'AI', 1),
('AI2', 'AI Year 2 Teacher', 'AI', 2),
('AI3', 'AI Year 3 Teacher', 'AI', 3),
('EE1', 'Electrical Year 1 Teacher', 'EE', 1),
('EE2', 'Electrical Year 2 Teacher', 'EE', 2),
('EE3', 'Electrical Year 3 Teacher', 'EE', 3),
('IT1', 'IT Year 1 Teacher', 'IT', 1),
('IT2', 'IT Year 2 Teacher', 'IT', 2),
('IT3', 'IT Year 3 Teacher', 'IT', 3);

-- Student Requests table
CREATE TABLE student_requests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    student_name VARCHAR(100) NOT NULL,
    roll_no VARCHAR(20) NOT NULL,
    branch VARCHAR(10) NOT NULL,
    year INT NOT NULL,
    request_type ENUM('leave', 'getpass', 'bonafide') NOT NULL,
    request_data JSON NOT NULL,
    class_teacher_status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    hod_status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    class_teacher_remarks TEXT,
    hod_remarks TEXT,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    class_teacher_updated_at TIMESTAMP NULL,
    hod_updated_at TIMESTAMP NULL
);

-- Insert demo student (optional)
INSERT INTO students (name, roll_no, enrollment_no, branch, year, email, password) 
VALUES ('Demo Student', '2024CM001', 'EN2024001', 'CM', 2, 'demo@college.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi');
-- Password: 123456 (hashed)
