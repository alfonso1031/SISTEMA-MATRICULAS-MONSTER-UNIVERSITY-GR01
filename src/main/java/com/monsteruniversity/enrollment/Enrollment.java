package com.monsteruniversity.enrollment;

import java.time.LocalDate;
import java.util.Objects;

/**
 * Represents an enrollment (matriculation) of a student in a course
 */
public class Enrollment {
    private final Student student;
    private final Course course;
    private final LocalDate enrollmentDate;
    private EnrollmentStatus status;
    
    public enum EnrollmentStatus {
        ACTIVE,
        DROPPED,
        COMPLETED
    }
    
    public Enrollment(Student student, Course course) {
        if (student == null) {
            throw new IllegalArgumentException("Student cannot be null");
        }
        if (course == null) {
            throw new IllegalArgumentException("Course cannot be null");
        }
        this.student = student;
        this.course = course;
        this.enrollmentDate = LocalDate.now();
        this.status = EnrollmentStatus.ACTIVE;
    }
    
    public Student getStudent() {
        return student;
    }
    
    public Course getCourse() {
        return course;
    }
    
    public LocalDate getEnrollmentDate() {
        return enrollmentDate;
    }
    
    public EnrollmentStatus getStatus() {
        return status;
    }
    
    public void setStatus(EnrollmentStatus status) {
        if (status == null) {
            throw new IllegalArgumentException("Status cannot be null");
        }
        this.status = status;
    }
    
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Enrollment that = (Enrollment) o;
        return Objects.equals(student, that.student) &&
               Objects.equals(course, that.course);
    }
    
    @Override
    public int hashCode() {
        return Objects.hash(student, course);
    }
    
    @Override
    public String toString() {
        return "Enrollment{" +
                "student=" + student.getName() +
                ", course=" + course.getCourseName() +
                ", enrollmentDate=" + enrollmentDate +
                ", status=" + status +
                '}';
    }
}
