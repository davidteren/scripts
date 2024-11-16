# Scripts Collection

Various scripts for development, tool use and other utilities for macOS.

## Available Scripts

### check_python_package.sh
A utility script to check for installed Python packages across multiple Python environments:
- All Python versions managed by asdf
- System Python installation

#### Usage
```bash
./check_python_package.sh package_name

# Example: Check for requests package
./check_python_package.sh requests

# Example: Check for numpy package
./check_python_package.sh numpy
```

#### Requirements
- macOS
- asdf version manager with Python plugin installed
- pip (Python package manager)

#### Features
- Checks all Python versions managed by asdf
- Checks system Python installation
- Provides clear output showing package presence/absence in each environment
- Displays Python versions installed
- Shows active/global Python version

## Installation

1. Clone this repository:
```bash
git clone git@github.com:davidteren/scripts.git
```

2. Make scripts executable:
```bash
cd scripts
chmod +x *.sh
```

3. (Optional) Add to your PATH:
Add the following line to your `~/.zshrc` or `~/.bashrc`:
```bash
export PATH="$HOME/scripts:$PATH"
```

## Contributing

Feel free to submit issues and enhancement requests!
