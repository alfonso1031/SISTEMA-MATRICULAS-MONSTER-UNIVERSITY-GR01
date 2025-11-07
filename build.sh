#!/bin/bash

# Build script for Monster University Enrollment System

echo "Building Monster University Enrollment System..."

# Create bin directory if it doesn't exist
mkdir -p bin

# Compile main source files
echo "Compiling source files..."
javac -d bin src/main/java/com/monsteruniversity/enrollment/*.java

if [ $? -ne 0 ]; then
    echo "Error: Compilation of source files failed"
    exit 1
fi

# Compile test files
echo "Compiling test files..."
javac -cp bin -d bin src/test/java/com/monsteruniversity/enrollment/*.java

if [ $? -ne 0 ]; then
    echo "Error: Compilation of test files failed"
    exit 1
fi

echo "Build successful!"
echo ""
echo "To run the application:"
echo "  ./run.sh"
echo ""
echo "To run tests:"
echo "  ./test.sh"
