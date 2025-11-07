package com.monsteruniversity.enrollment;

import java.util.HashMap;
import java.util.Map;

/**
 * Service class to manage enrollments (matriculations) at Monster University
 */
public class EnrollmentService {
    private final Map<String, Student> students;
    private final Map<String, Course> courses;
    private static final int MAX_CREDITS_PER_STUDENT = 18;
    
    public EnrollmentService() {
        this.students = new HashMap<>();
        this.courses = new HashMap<>();
    }
    
    public void addStudent(Student student) {
        if (student == null) {
            throw new IllegalArgumentException("Student cannot be null");
        }
        students.put(student.getStudentId(), student);
    }
    
    public void addCourse(Course course) {
        if (course == null) {
            throw new IllegalArgumentException("Course cannot be null");
        }
        courses.put(course.getCourseCode(), course);
    }
    
    public Student getStudent(String studentId) {
        return students.get(studentId);
    }
    
    public Course getCourse(String courseCode) {
        return courses.get(courseCode);
    }
    
    /**
     * Enroll a student in a course (matriculate)
     */
    public Enrollment enrollStudent(String studentId, String courseCode) 
            throws EnrollmentException {
        Student student = students.get(studentId);
        if (student == null) {
            throw new EnrollmentException("Student not found: " + studentId);
        }
        
        Course course = courses.get(courseCode);
        if (course == null) {
            throw new EnrollmentException("Course not found: " + courseCode);
        }
        
        // Check if already enrolled
        for (Enrollment enrollment : student.getEnrollments()) {
            if (enrollment.getCourse().equals(course) && 
                enrollment.getStatus() == Enrollment.EnrollmentStatus.ACTIVE) {
                throw new EnrollmentException("Student is already enrolled in this course");
            }
        }
        
        // Check course capacity
        if (course.isFull()) {
            throw new EnrollmentException("Course is full");
        }
        
        // Check credit limit
        int currentCredits = student.getTotalCredits();
        if (currentCredits + course.getCredits() > MAX_CREDITS_PER_STUDENT) {
            throw new EnrollmentException("Enrollment would exceed maximum credit limit of " + 
                                         MAX_CREDITS_PER_STUDENT);
        }
        
        // Create enrollment
        Enrollment enrollment = new Enrollment(student, course);
        student.addEnrollment(enrollment);
        course.addEnrollment(enrollment);
        
        return enrollment;
    }
    
    /**
     * Drop a student from a course
     */
    public void dropEnrollment(String studentId, String courseCode) 
            throws EnrollmentException {
        Student student = students.get(studentId);
        if (student == null) {
            throw new EnrollmentException("Student not found: " + studentId);
        }
        
        Course course = courses.get(courseCode);
        if (course == null) {
            throw new EnrollmentException("Course not found: " + courseCode);
        }
        
        Enrollment enrollmentToRemove = null;
        for (Enrollment enrollment : student.getEnrollments()) {
            if (enrollment.getCourse().equals(course) && 
                enrollment.getStatus() == Enrollment.EnrollmentStatus.ACTIVE) {
                enrollmentToRemove = enrollment;
                break;
            }
        }
        
        if (enrollmentToRemove == null) {
            throw new EnrollmentException("Student is not enrolled in this course");
        }
        
        enrollmentToRemove.setStatus(Enrollment.EnrollmentStatus.DROPPED);
        course.removeEnrollment(enrollmentToRemove);
    }
    
    public Map<String, Student> getAllStudents() {
        return new HashMap<>(students);
    }
    
    public Map<String, Course> getAllCourses() {
        return new HashMap<>(courses);
    }
}
