# check_python_package.sh Documentation

## Overview
This script helps you check for the presence of a Python package across different Python environments on your macOS system. It's particularly useful when working with multiple Python versions managed by asdf and when you need to verify package installations.

## Detailed Description

The script performs the following checks:
1. Lists all Python versions managed by asdf
2. For each asdf Python version:
   - Checks if the specified package is installed
   - Shows the package version if installed
   - Indicates if the package is not found
3. Checks the system Python installation:
   - Shows the system Python version
   - Checks if the package is installed
   - Shows the package version if installed

## Prerequisites

- macOS operating system
- asdf version manager installed
- asdf Python plugin installed
- pip package manager
- Terminal access

## Installation

1. Ensure the script is executable:
```bash
chmod +x check_python_package.sh
```

2. (Optional) Make it available system-wide by either:
   - Adding the scripts directory to your PATH
   - Creating a symbolic link to /usr/local/bin:
     ```bash
     ln -s /path/to/check_python_package.sh /usr/local/bin/check_python_package
     ```

## Usage Examples

1. Basic usage:
```bash
./check_python_package.sh requests
```

2. Check for multiple packages:
```bash
for package in requests numpy pandas; do
    ./check_python_package.sh $package
done
```

3. Using with specific Python version:
```bash
ASDF_PYTHON_VERSION=3.11.10 ./check_python_package.sh requests
```

## Output Format

The script output is organized into sections:
```
=== ASDF Python Versions ===
[Lists all installed Python versions]

=== Checking each ASDF Python version for [package] package ===
[Shows results for each Python version]

=== Checking System Python ===
[Shows system Python results]
```

## Troubleshooting

Common issues and solutions:

1. Script not executable:
```bash
chmod +x check_python_package.sh
```

2. asdf not found:
```bash
# Add to ~/.zshrc or ~/.bashrc:
. /opt/homebrew/opt/asdf/libexec/asdf.sh
```

3. pip not installed for a Python version:
```bash
ASDF_PYTHON_VERSION=<version> python -m ensurepip
```

## Contributing

Feel free to submit issues, fork the repository and create pull requests for any improvements.