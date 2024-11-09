#!/bin/bash

function jwt_decode {
  token=$1

  # Extract the header, payload, and signature
  header=$(echo "$token" | cut -d '.' -f1)
  payload=$(echo "$token" | cut -d '.' -f2)
  signature=$(echo "$token" | cut -d '.' -f3)

  # Add padding if needed
  add_padding() {
    local input=$1
    local length=$(( ${#input} % 4 ))
    if [[ $length -eq 2 ]]; then
      input="${input}=="
    elif [[ $length -eq 3 ]]; then
      input="${input}="
    fi
    echo "$input"
  }

  # Decode each part and print with color
  echo " === Header ==="
  echo "$(add_padding "$header" | base64 --decode 2>/dev/null | jq --color-output '.')"
  
  echo " === Payload ==="
  echo "$(add_padding "$payload" | base64 --decode 2>/dev/null | jq --color-output '.')"
  
  echo " === Signature in base64 ==="
  echo "$signature"
}


