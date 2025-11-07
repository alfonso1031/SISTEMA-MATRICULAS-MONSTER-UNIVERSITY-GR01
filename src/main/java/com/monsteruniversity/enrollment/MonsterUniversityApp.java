package com.monsteruniversity.enrollment;

import java.util.Scanner;

/**
 * Main application for Monster University Enrollment System
 */
public class MonsterUniversityApp {
    private final EnrollmentService enrollmentService;
    private final Scanner scanner;
    
    public MonsterUniversityApp() {
        this.enrollmentService = new EnrollmentService();
        this.scanner = new Scanner(System.in);
        initializeSampleData();
    }
    
    private void initializeSampleData() {
        // Add sample students
        enrollmentService.addStudent(new Student("MU001", "Mike Wazowski", "Scaring"));
        enrollmentService.addStudent(new Student("MU002", "James P. Sullivan", "Scaring"));
        enrollmentService.addStudent(new Student("MU003", "Randall Boggs", "Scaring"));
        enrollmentService.addStudent(new Student("MU004", "Celia Mae", "Administration"));
        
        // Add sample courses
        enrollmentService.addCourse(new Course("SCARE101", "Introduction to Scaring", 3, 30));
        enrollmentService.addCourse(new Course("SCARE201", "Advanced Scaring Techniques", 4, 25));
        enrollmentService.addCourse(new Course("DOOR301", "Door Technology", 3, 20));
        enrollmentService.addCourse(new Course("ROAR101", "Roaring Fundamentals", 2, 35));
        enrollmentService.addCourse(new Course("STEALTH201", "Stealth and Sneaking", 3, 30));
    }
    
    public void run() {
        System.out.println("==============================================");
        System.out.println("   MONSTER UNIVERSITY ENROLLMENT SYSTEM");
        System.out.println("   Sistema de Matriculas Monster University");
        System.out.println("==============================================\n");
        
        boolean running = true;
        while (running) {
            displayMenu();
            String choice = scanner.nextLine().trim();
            
            switch (choice) {
                case "1":
                    listStudents();
                    break;
                case "2":
                    listCourses();
                    break;
                case "3":
                    enrollStudent();
                    break;
                case "4":
                    dropEnrollment();
                    break;
                case "5":
                    viewStudentEnrollments();
                    break;
                case "6":
                    viewCourseEnrollments();
                    break;
                case "7":
                    addNewStudent();
                    break;
                case "8":
                    addNewCourse();
                    break;
                case "0":
                    running = false;
                    System.out.println("Exiting system. Goodbye!");
                    break;
                default:
                    System.out.println("Invalid option. Please try again.\n");
            }
        }
    }
    
    private void displayMenu() {
        System.out.println("\n--- MAIN MENU ---");
        System.out.println("1. List all students");
        System.out.println("2. List all courses");
        System.out.println("3. Enroll student in course");
        System.out.println("4. Drop student from course");
        System.out.println("5. View student enrollments");
        System.out.println("6. View course enrollments");
        System.out.println("7. Add new student");
        System.out.println("8. Add new course");
        System.out.println("0. Exit");
        System.out.print("\nSelect an option: ");
    }
    
    private void listStudents() {
        System.out.println("\n--- ALL STUDENTS ---");
        enrollmentService.getAllStudents().values().forEach(student -> {
            System.out.println(student.getStudentId() + " - " + student.getName() + 
                             " (" + student.getMajor() + ") - Credits: " + student.getTotalCredits());
        });
    }
    
    private void listCourses() {
        System.out.println("\n--- ALL COURSES ---");
        enrollmentService.getAllCourses().values().forEach(course -> {
            System.out.println(course.getCourseCode() + " - " + course.getCourseName() + 
                             " (" + course.getCredits() + " credits) - Available: " + 
                             course.getAvailableSeats() + "/" + course.getCapacity());
        });
    }
    
    private void enrollStudent() {
        System.out.print("\nEnter student ID: ");
        String studentId = scanner.nextLine().trim();
        System.out.print("Enter course code: ");
        String courseCode = scanner.nextLine().trim();
        
        try {
            Enrollment enrollment = enrollmentService.enrollStudent(studentId, courseCode);
            System.out.println("SUCCESS: " + enrollment.getStudent().getName() + 
                             " enrolled in " + enrollment.getCourse().getCourseName());
        } catch (EnrollmentException e) {
            System.out.println("ERROR: " + e.getMessage());
        }
    }
    
    private void dropEnrollment() {
        System.out.print("\nEnter student ID: ");
        String studentId = scanner.nextLine().trim();
        System.out.print("Enter course code: ");
        String courseCode = scanner.nextLine().trim();
        
        try {
            enrollmentService.dropEnrollment(studentId, courseCode);
            System.out.println("SUCCESS: Student dropped from course");
        } catch (EnrollmentException e) {
            System.out.println("ERROR: " + e.getMessage());
        }
    }
    
    private void viewStudentEnrollments() {
        System.out.print("\nEnter student ID: ");
        String studentId = scanner.nextLine().trim();
        Student student = enrollmentService.getStudent(studentId);
        
        if (student == null) {
            System.out.println("ERROR: Student not found");
            return;
        }
        
        System.out.println("\n--- ENROLLMENTS FOR " + student.getName() + " ---");
        System.out.println("Major: " + student.getMajor());
        System.out.println("Total Credits: " + student.getTotalCredits());
        System.out.println("\nCourses:");
        student.getEnrollments().forEach(enrollment -> {
            if (enrollment.getStatus() == Enrollment.EnrollmentStatus.ACTIVE) {
                System.out.println("  - " + enrollment.getCourse().getCourseCode() + 
                                 ": " + enrollment.getCourse().getCourseName() + 
                                 " (" + enrollment.getCourse().getCredits() + " credits)");
            }
        });
    }
    
    private void viewCourseEnrollments() {
        System.out.print("\nEnter course code: ");
        String courseCode = scanner.nextLine().trim();
        Course course = enrollmentService.getCourse(courseCode);
        
        if (course == null) {
            System.out.println("ERROR: Course not found");
            return;
        }
        
        System.out.println("\n--- ENROLLMENTS FOR " + course.getCourseName() + " ---");
        System.out.println("Course Code: " + course.getCourseCode());
        System.out.println("Credits: " + course.getCredits());
        System.out.println("Capacity: " + course.getEnrollments().size() + "/" + course.getCapacity());
        System.out.println("\nEnrolled Students:");
        course.getEnrollments().forEach(enrollment -> {
            System.out.println("  - " + enrollment.getStudent().getStudentId() + 
                             ": " + enrollment.getStudent().getName());
        });
    }
    
    private void addNewStudent() {
        System.out.print("\nEnter student ID: ");
        String studentId = scanner.nextLine().trim();
        System.out.print("Enter student name: ");
        String name = scanner.nextLine().trim();
        System.out.print("Enter major: ");
        String major = scanner.nextLine().trim();
        
        try {
            Student student = new Student(studentId, name, major);
            enrollmentService.addStudent(student);
            System.out.println("SUCCESS: Student added successfully");
        } catch (IllegalArgumentException e) {
            System.out.println("ERROR: " + e.getMessage());
        }
    }
    
    private void addNewCourse() {
        System.out.print("\nEnter course code: ");
        String courseCode = scanner.nextLine().trim();
        System.out.print("Enter course name: ");
        String courseName = scanner.nextLine().trim();
        System.out.print("Enter credits: ");
        String creditsStr = scanner.nextLine().trim();
        System.out.print("Enter capacity: ");
        String capacityStr = scanner.nextLine().trim();
        
        try {
            int credits = Integer.parseInt(creditsStr);
            int capacity = Integer.parseInt(capacityStr);
            Course course = new Course(courseCode, courseName, credits, capacity);
            enrollmentService.addCourse(course);
            System.out.println("SUCCESS: Course added successfully");
        } catch (NumberFormatException e) {
            System.out.println("ERROR: Credits and capacity must be valid numbers");
        } catch (IllegalArgumentException e) {
            System.out.println("ERROR: " + e.getMessage());
        }
    }
    
    public static void main(String[] args) {
        MonsterUniversityApp app = new MonsterUniversityApp();
        app.run();
    }
}
