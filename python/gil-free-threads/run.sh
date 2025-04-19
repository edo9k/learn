#!/bin/bash 

echo "=== Running on Python 3.13 WITH GIL ===" 
podman run --rm py13-gil
echo " "

echo "=== Running on Python 3.13 WITHOUT GIL ===" 
podman run --rm py13-nogil
echo " "

