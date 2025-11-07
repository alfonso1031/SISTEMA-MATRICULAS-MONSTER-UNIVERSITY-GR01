package com.monsteruniversity.enrollment;

/**
 * Simple test class for the enrollment system
 * Tests core functionality without external dependencies
 */
public class EnrollmentSystemTest {
    
    public static void main(String[] args) {
        System.out.println("Running Enrollment System Tests...\n");
        
        int passed = 0;
        int total = 0;
        
        // Test 1: Create Student
        total++;
        try {
            Student student = new Student("TEST001", "Test Monster", "Testing");
            assert student.getStudentId().equals("TEST001");
            assert student.getName().equals("Test Monster");
            assert student.getMajor().equals("Testing");
            System.out.println("✓ Test 1 PASSED: Create Student");
            passed++;
        } catch (Exception e) {
            System.out.println("✗ Test 1 FAILED: Create Student - " + e.getMessage());
        }
        
        // Test 2: Create Course
        total++;
        try {
            Course course = new Course("TEST101", "Test Course", 3, 30);
            assert course.getCourseCode().equals("TEST101");
            assert course.getCourseName().equals("Test Course");
            assert course.getCredits() == 3;
            assert course.getCapacity() == 30;
            System.out.println("✓ Test 2 PASSED: Create Course");
            passed++;
        } catch (Exception e) {
            System.out.println("✗ Test 2 FAILED: Create Course - " + e.getMessage());
        }
        
        // Test 3: Successful Enrollment
        total++;
        try {
            EnrollmentService service = new EnrollmentService();
            Student student = new Student("TEST001", "Test Monster", "Testing");
            Course course = new Course("TEST101", "Test Course", 3, 30);
            service.addStudent(student);
            service.addCourse(course);
            
            Enrollment enrollment = service.enrollStudent("TEST001", "TEST101");
            assert enrollment.getStudent().equals(student);
            assert enrollment.getCourse().equals(course);
            assert enrollment.getStatus() == Enrollment.EnrollmentStatus.ACTIVE;
            System.out.println("✓ Test 3 PASSED: Successful Enrollment");
            passed++;
        } catch (Exception e) {
            System.out.println("✗ Test 3 FAILED: Successful Enrollment - " + e.getMessage());
        }
        
        // Test 4: Prevent Duplicate Enrollment
        total++;
        try {
            EnrollmentService service = new EnrollmentService();
            Student student = new Student("TEST001", "Test Monster", "Testing");
            Course course = new Course("TEST101", "Test Course", 3, 30);
            service.addStudent(student);
            service.addCourse(course);
            
            service.enrollStudent("TEST001", "TEST101");
            try {
                service.enrollStudent("TEST001", "TEST101");
                System.out.println("✗ Test 4 FAILED: Should have prevented duplicate enrollment");
            } catch (EnrollmentException e) {
                System.out.println("✓ Test 4 PASSED: Prevent Duplicate Enrollment");
                passed++;
            }
        } catch (Exception e) {
            System.out.println("✗ Test 4 FAILED: Prevent Duplicate Enrollment - " + e.getMessage());
        }
        
        // Test 5: Prevent Over-Capacity Enrollment
        total++;
        try {
            EnrollmentService service = new EnrollmentService();
            Course course = new Course("TEST101", "Test Course", 3, 2);
            service.addCourse(course);
            
            Student student1 = new Student("TEST001", "Monster 1", "Testing");
            Student student2 = new Student("TEST002", "Monster 2", "Testing");
            Student student3 = new Student("TEST003", "Monster 3", "Testing");
            service.addStudent(student1);
            service.addStudent(student2);
            service.addStudent(student3);
            
            service.enrollStudent("TEST001", "TEST101");
            service.enrollStudent("TEST002", "TEST101");
            
            try {
                service.enrollStudent("TEST003", "TEST101");
                System.out.println("✗ Test 5 FAILED: Should have prevented over-capacity enrollment");
            } catch (EnrollmentException e) {
                System.out.println("✓ Test 5 PASSED: Prevent Over-Capacity Enrollment");
                passed++;
            }
        } catch (Exception e) {
            System.out.println("✗ Test 5 FAILED: Prevent Over-Capacity Enrollment - " + e.getMessage());
        }
        
        // Test 6: Enforce Credit Limit
        total++;
        try {
            EnrollmentService service = new EnrollmentService();
            Student student = new Student("TEST001", "Test Monster", "Testing");
            service.addStudent(student);
            
            // Add courses totaling more than 18 credits
            Course course1 = new Course("TEST101", "Course 1", 10, 30);
            Course course2 = new Course("TEST102", "Course 2", 9, 30);
            service.addCourse(course1);
            service.addCourse(course2);
            
            service.enrollStudent("TEST001", "TEST101");
            try {
                service.enrollStudent("TEST001", "TEST102");
                System.out.println("✗ Test 6 FAILED: Should have enforced credit limit");
            } catch (EnrollmentException e) {
                System.out.println("✓ Test 6 PASSED: Enforce Credit Limit");
                passed++;
            }
        } catch (Exception e) {
            System.out.println("✗ Test 6 FAILED: Enforce Credit Limit - " + e.getMessage());
        }
        
        // Test 7: Drop Enrollment
        total++;
        try {
            EnrollmentService service = new EnrollmentService();
            Student student = new Student("TEST001", "Test Monster", "Testing");
            Course course = new Course("TEST101", "Test Course", 3, 30);
            service.addStudent(student);
            service.addCourse(course);
            
            service.enrollStudent("TEST001", "TEST101");
            assert course.getEnrollments().size() == 1;
            
            service.dropEnrollment("TEST001", "TEST101");
            assert course.getEnrollments().size() == 0;
            System.out.println("✓ Test 7 PASSED: Drop Enrollment");
            passed++;
        } catch (Exception e) {
            System.out.println("✗ Test 7 FAILED: Drop Enrollment - " + e.getMessage());
        }
        
        // Test 8: Calculate Total Credits
        total++;
        try {
            EnrollmentService service = new EnrollmentService();
            Student student = new Student("TEST001", "Test Monster", "Testing");
            Course course1 = new Course("TEST101", "Course 1", 3, 30);
            Course course2 = new Course("TEST102", "Course 2", 4, 30);
            service.addStudent(student);
            service.addCourse(course1);
            service.addCourse(course2);
            
            service.enrollStudent("TEST001", "TEST101");
            service.enrollStudent("TEST001", "TEST102");
            
            assert student.getTotalCredits() == 7;
            System.out.println("✓ Test 8 PASSED: Calculate Total Credits");
            passed++;
        } catch (Exception e) {
            System.out.println("✗ Test 8 FAILED: Calculate Total Credits - " + e.getMessage());
        }
        
        // Test 9: Validate Student Input
        total++;
        try {
            try {
                Student student = new Student("", "Test Monster", "Testing");
                System.out.println("✗ Test 9 FAILED: Should have rejected empty student ID");
            } catch (IllegalArgumentException e) {
                System.out.println("✓ Test 9 PASSED: Validate Student Input");
                passed++;
            }
        } catch (Exception e) {
            System.out.println("✗ Test 9 FAILED: Validate Student Input - " + e.getMessage());
        }
        
        // Test 10: Validate Course Input
        total++;
        try {
            try {
                Course course = new Course("TEST101", "Test Course", -1, 30);
                System.out.println("✗ Test 10 FAILED: Should have rejected negative credits");
            } catch (IllegalArgumentException e) {
                System.out.println("✓ Test 10 PASSED: Validate Course Input");
                passed++;
            }
        } catch (Exception e) {
            System.out.println("✗ Test 10 FAILED: Validate Course Input - " + e.getMessage());
        }
        
        // Summary
        System.out.println("\n" + "=".repeat(50));
        System.out.println("Test Results: " + passed + "/" + total + " tests passed");
        System.out.println("=".repeat(50));
        
        if (passed == total) {
            System.out.println("All tests passed successfully!");
            System.exit(0);
        } else {
            System.out.println("Some tests failed.");
            System.exit(1);
        }
    }
}
