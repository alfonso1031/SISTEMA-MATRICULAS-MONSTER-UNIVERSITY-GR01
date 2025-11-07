# SISTEMA MATRICULAS MONSTER UNIVERSITY

A student enrollment (matriculation) management system for Monster University, inspired by Pixar's Monsters University.

## Description

This system allows managing student enrollments in courses at Monster University. It provides functionality to:
- Register students and courses
- Enroll students in courses (matriculate)
- Drop students from courses
- View student and course information
- Track enrollment capacity and credit limits

## Features

- **Student Management**: Add and track students with ID, name, and major
- **Course Management**: Add courses with code, name, credits, and capacity
- **Enrollment System**: 
  - Enroll students in courses with validation
  - Prevent over-enrollment (course capacity limits)
  - Enforce credit limits (max 18 credits per student)
  - Prevent duplicate enrollments
- **Information Display**: View all students, courses, and their enrollments

## Project Structure

```
src/main/java/com/monsteruniversity/enrollment/
├── Student.java           - Student entity class
├── Course.java            - Course entity class
├── Enrollment.java        - Enrollment entity class
├── EnrollmentService.java - Business logic for enrollment operations
├── EnrollmentException.java - Custom exception for enrollment errors
└── MonsterUniversityApp.java - Main application with interactive menu
```

## Prerequisites

- Java Development Kit (JDK) 8 or higher

## How to Compile

```bash
javac -d bin src/main/java/com/monsteruniversity/enrollment/*.java
```

## How to Run

```bash
java -cp bin com.monsteruniversity.enrollment.MonsterUniversityApp
```

## Usage

The system starts with sample data:

**Students:**
- MU001 - Mike Wazowski (Scaring)
- MU002 - James P. Sullivan (Scaring)
- MU003 - Randall Boggs (Scaring)
- MU004 - Celia Mae (Administration)

**Courses:**
- SCARE101 - Introduction to Scaring (3 credits, 30 capacity)
- SCARE201 - Advanced Scaring Techniques (4 credits, 25 capacity)
- DOOR301 - Door Technology (3 credits, 20 capacity)
- ROAR101 - Roaring Fundamentals (2 credits, 35 capacity)
- STEALTH201 - Stealth and Sneaking (3 credits, 30 capacity)

### Menu Options

1. **List all students** - Display all registered students
2. **List all courses** - Display all available courses
3. **Enroll student in course** - Matriculate a student in a course
4. **Drop student from course** - Remove a student from a course
5. **View student enrollments** - See all courses a student is enrolled in
6. **View course enrollments** - See all students enrolled in a course
7. **Add new student** - Register a new student
8. **Add new course** - Create a new course
0. **Exit** - Close the application

## Business Rules

- Students cannot enroll in the same course twice
- Courses have a maximum capacity that cannot be exceeded
- Students cannot exceed 18 credits total
- Enrollment dates are automatically recorded
- Dropped enrollments maintain history but free up course capacity

## Example Workflow

```
1. List all courses to see available options
2. Choose a student ID (e.g., MU001)
3. Enroll student in a course (option 3)
4. View student enrollments to confirm (option 5)
5. Drop enrollment if needed (option 4)
```

## Author

Monster University - Grupo 01
