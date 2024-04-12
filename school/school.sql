-- Drops existing tables, so we start fresh with each
-- run of this script
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS teachers;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS sections;
DROP TABLE IF EXISTS enrollments;

CREATE TABLE students (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  phone_number TEXT
);

-- Create the rest of the tables

CREATE TABLE teachers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name TEXT,
  last_name TEXT,
  bio TEXT
);

CREATE TABLE courses (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  description TEXT
);

CREATE TABLE sections (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  time TEXT,
  course_id INTEGER,
  teacher_id INTEGER
);

CREATE TABLE enrollments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  section_id INTEGER,
  student_id INTEGER
);

-- Inserting values into the created tables

INSERT INTO students ("first_name", "last_name", "email", "phone_number")
VALUES ("Jane", "Doe", "jane@example.com", "555-1212"),
("Jenny", "Smith", "jenny@gmail.com", "867-5309"),
("John", "Johnson", "john@acme.com", "456-7890");

INSERT INTO teachers ("first_name", "last_name", "bio")
VALUES ("Ben", "Block", "A seasoned pro instructor."),
("Brian", "Eng", "Loves tacos.");

INSERT INTO courses ("name", "description")
VALUES ("Intro to Software Development", "This course is focused on software development..."),
("Taco-Making 101", "In this course, you'll learn how to build a proper taco...");

INSERT INTO sections ("time", "course_id", "teacher_id")
VALUES ("Tuesday 8:30-11:30", "1", "2"),
("Wednesday 6-9pm", "1", "1"),
("Wednesday 6-9pm", "2", "2"),
("Thursday 6-9pm", "2", "1");

SELECT students.last_name, courses.name
FROM students INNER JOIN courses ON courses.id = students.id
GROUP BY courses.name
ORDER BY courses.name;