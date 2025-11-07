#!/bin/bash

# Run script for Monster University Enrollment System

if [ ! -d "bin" ]; then
    echo "Build directory not found. Running build first..."
    ./build.sh
fi

echo "Starting Monster University Enrollment System..."
echo ""
java -cp bin com.monsteruniversity.enrollment.MonsterUniversityApp
