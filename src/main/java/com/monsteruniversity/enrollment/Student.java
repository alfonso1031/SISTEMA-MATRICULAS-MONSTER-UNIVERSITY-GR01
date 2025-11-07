package com.monsteruniversity.enrollment;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * Represents a student at Monster University
 */
public class Student {
    private final String studentId;
    private String name;
    private String major;
    private final List<Enrollment> enrollments;
    
    public Student(String studentId, String name, String major) {
        if (studentId == null || studentId.trim().isEmpty()) {
            throw new IllegalArgumentException("Student ID cannot be null or empty");
        }
        if (name == null || name.trim().isEmpty()) {
            throw new IllegalArgumentException("Student name cannot be null or empty");
        }
        this.studentId = studentId;
        this.name = name;
        this.major = major;
        this.enrollments = new ArrayList<>();
    }
    
    public String getStudentId() {
        return studentId;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        if (name == null || name.trim().isEmpty()) {
            throw new IllegalArgumentException("Student name cannot be null or empty");
        }
        this.name = name;
    }
    
    public String getMajor() {
        return major;
    }
    
    public void setMajor(String major) {
        this.major = major;
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
    
    public int getTotalCredits() {
        return enrollments.stream()
            .mapToInt(e -> e.getCourse().getCredits())
            .sum();
    }
    
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Student student = (Student) o;
        return Objects.equals(studentId, student.studentId);
    }
    
    @Override
    public int hashCode() {
        return Objects.hash(studentId);
    }
    
    @Override
    public String toString() {
        return "Student{" +
                "studentId='" + studentId + '\'' +
                ", name='" + name + '\'' +
                ", major='" + major + '\'' +
                ", enrollments=" + enrollments.size() +
                '}';
    }
}
