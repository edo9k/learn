#!/bin/bash

# Build the base image
podman build -f Dockerfile.base -t python-builder-base .

# Build Python with GIL
podman build -f Dockerfile.withgil  -t py13-gil

# Build Python no-GIL
podman build -f Dockerfile.nogil    -t py13-nogil 

