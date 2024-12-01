#!/bin/bash

echo "Starting the application..."

# Check if the required Python environment is set up
if ! command -v python3 &> /dev/null; then
    echo "Python3 is not installed. Please install it first."
    exit 1
fi

# Install dependencies
pip install -r requirements.txt

# Start the application
python src/app.py
