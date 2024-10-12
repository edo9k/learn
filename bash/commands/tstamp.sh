#!/bin/bash

pytimestamp () {
  if [ -z "$1"]; then 
    echo "Usage: pytimestamp <timestamp>"
    return 1
  fi

	python -c "import datetime; print( datetime.datetime.fromtimestamp($1))"
}
