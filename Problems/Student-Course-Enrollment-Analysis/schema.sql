CREATE DATABASE join_practice;
USE join_practice;

CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Courses (
    id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

CREATE TABLE Enrollments (
    id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(id),
    FOREIGN KEY (course_id) REFERENCES Courses(id)
);
