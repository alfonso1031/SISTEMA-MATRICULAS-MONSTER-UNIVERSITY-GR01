#!/bin/bash

# Test script for Monster University Enrollment System

if [ ! -d "bin" ]; then
    echo "Build directory not found. Running build first..."
    ./build.sh
fi

echo "Running tests..."
echo ""
java -ea -cp bin com.monsteruniversity.enrollment.EnrollmentSystemTest
