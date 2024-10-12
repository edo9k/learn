#!/bin/bash

function fuckthis {
  if [ "$1" == "search" ]; then

    package_name="${*:2}"

    BLUE="\033[34m"
    RESET="\033[0m"

    # apt search
    echo -e "\n${BLUE}=== apt ===${RESET}"
    apt-cache search "$package_name" | grep -i -- "$package_name"

    # snap search
    echo -e "\n${BLUE}=== snap ===${RESET}"
    snap find "$package_name" | awk '{print $1}' | grep -i -- "$package_name"

    # flatpak search
    echo -e "\n${BLUE}=== flatpak ===${RESET}"
    flatpak search "$package_name" | awk '{print $1}' | grep -i -- "$package_name"

    # pip search using pip_search
    echo -e "\n${BLUE}=== pip ===${RESET}"
    pip_search "$package_name" | grep -i -- "$package_name"

    # npm search
    echo -e "\n${BLUE}=== npm ===${RESET}"
    npm search "$package_name" --json | jq -r '.[].name' | grep -i -- "$package_name"

  else
    echo "Usage: fuckthis search <package_name>"
  fi
}

