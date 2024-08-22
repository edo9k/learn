# Use a Linux base image
FROM ubuntu:latest

# Install required packages
RUN apt-get update && apt-get install -y \
    wget \
    mono-complete \
    && rm -rf /var/lib/apt/lists/*

# Install PowerShell Core
RUN wget -q https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && apt-get update \
    && apt-get install -y powershell \
    && rm -f packages-microsoft-prod.deb

# Install IronPython
RUN wget -q https://github.com/IronLanguages/ironpython2/releases/download/ipy-2.7.10/ironpython-2.7.10.tar.gz \
    && tar -xzf ironpython-2.7.10.tar.gz \
    && mv IronPython-2.7.10 /opt/ironpython \
    && rm -f ironpython-2.7.10.tar.gz

# Set environment variables
ENV PATH="/opt/ironpython:${PATH}"

# Set the working directory
WORKDIR /app

