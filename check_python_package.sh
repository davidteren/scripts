#!/bin/bash

#===================================================================================
# check_python_package.sh
#===================================================================================
# Description:
#   This script checks for the presence of a specified Python package across all
#   Python installations managed by asdf and the system Python installation.
#
# Usage:
#   ./check_python_package.sh package_name
#
# Arguments:
#   package_name - Name of the Python package to check for (case-insensitive)
#
# Examples:
#   ./check_python_package.sh requests
#   ./check_python_package.sh numpy
#
# Requirements:
#   - macOS
#   - asdf version manager with Python plugin
#   - pip package manager
#
# Notes:
#   - The script will check all Python versions managed by asdf
#   - The system Python installation will also be checked
#   - The search is case-insensitive
#   - Exit code 1 if no package name provided
#
# Author: David Teren
# Repository: https://github.com/davidteren/scripts
#===================================================================================

if [ -z "$1" ]; then
    echo "Please provide a package name"
    echo "Usage: $0 package_name"
    exit 1
fi

PACKAGE_NAME="$1"

# Check asdf Python versions
echo "=== ASDF Python Versions ==="
asdf list python

echo -e "\n=== Checking each ASDF Python version for $PACKAGE_NAME package ==="
# Get all asdf Python versions and check pip list for each
asdf list python | grep -v "*" | while read -r version; do
    if [ ! -z "$version" ]; then
        echo -e "\nChecking Python $version:"
        ASDF_PYTHON_VERSION=$version pip list | grep -i "$PACKAGE_NAME" || echo "$PACKAGE_NAME not found in Python $version"
    fi
done

echo -e "\n=== Checking System Python ==="
# Check system Python version and pip list
/usr/bin/python3 -V
/usr/bin/python3 -m pip list 2>/dev/null | grep -i "$PACKAGE_NAME" || echo "$PACKAGE_NAME not found in system Python"