package com.monsteruniversity.enrollment;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * Represents a course at Monster University
 */
public class Course {
    private final String courseCode;
    private String courseName;
    private int credits;
    private int capacity;
    private final List<Enrollment> enrollments;
    
    public Course(String courseCode, String courseName, int credits, int capacity) {
        if (courseCode == null || courseCode.trim().isEmpty()) {
            throw new IllegalArgumentException("Course code cannot be null or empty");
        }
        if (courseName == null || courseName.trim().isEmpty()) {
            throw new IllegalArgumentException("Course name cannot be null or empty");
        }
        if (credits <= 0) {
            throw new IllegalArgumentException("Credits must be positive");
        }
        if (capacity <= 0) {
            throw new IllegalArgumentException("Capacity must be positive");
        }
        this.courseCode = courseCode;
        this.courseName = courseName;
        this.credits = credits;
        this.capacity = capacity;
        this.enrollments = new ArrayList<>();
    }
    
    public String getCourseCode() {
        return courseCode;
    }
    
    public String getCourseName() {
        return courseName;
    }
    
    public void setCourseName(String courseName) {
        if (courseName == null || courseName.trim().isEmpty()) {
            throw new IllegalArgumentException("Course name cannot be null or empty");
        }
        this.courseName = courseName;
    }
    
    public int getCredits() {
        return credits;
    }
    
    public void setCredits(int credits) {
        if (credits <= 0) {
            throw new IllegalArgumentException("Credits must be positive");
        }
        this.credits = credits;
    }
    
    public int getCapacity() {
        return capacity;
    }
    
    public void setCapacity(int capacity) {
        if (capacity <= 0) {
            throw new IllegalArgumentException("Capacity must be positive");
        }
        this.capacity = capacity;
    }
    
    public List<Enrollment> getEnrollments() {
        return new ArrayList<>(enrollments);
    }
    
    public void addEnrollment(Enrollment enrollment) {
        if (enrollment != null && !enrollments.contains(enrollment)) {
            enrollments.add(enrollment);
        }
    }
    
    public void removeEnrollment(Enrollment enrollment) {
        enrollments.remove(enrollment);
    }
    
    public int getAvailableSeats() {
        return capacity - enrollments.size();
    }
    
    public boolean isFull() {
        return enrollments.size() >= capacity;
    }
    
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Course course = (Course) o;
        return Objects.equals(courseCode, course.courseCode);
    }
    
    @Override
    public int hashCode() {
        return Objects.hash(courseCode);
    }
    
    @Override
    public String toString() {
        return "Course{" +
                "courseCode='" + courseCode + '\'' +
                ", courseName='" + courseName + '\'' +
                ", credits=" + credits +
                ", capacity=" + capacity +
                ", enrolled=" + enrollments.size() +
                '}';
    }
}
