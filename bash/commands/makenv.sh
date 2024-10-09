#!/bin/bash

function makenv {
  if [ -d "venv" ]; then
    # If venv directory exists, check Python version
    echo "Virtual environment already exists in 'venv'"
    source venv/bin/activate
    python --version
  else
    # Create virtual environment in 'venv' directory
    echo "Creating virtual environment in 'venv'..."
    python -m venv venv

    # Activate virtual environment
    source venv/bin/activate

    # Upgrade pip and install pip-tools
    echo "Upgrading pip and installing pip-tools..."
    pip install --upgrade pip
    pip install pip-tools
  fi
}
