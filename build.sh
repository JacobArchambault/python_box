#!/bin/bash

# Set desired name via CLI argument, but default to "python_box"
name="${1:-python_box}"

echo "Cleaning existing image and container(s) if any exist"
toolbox rmi "$name" --force &> /dev/null

cd $(dirname "${BASH_SOURCE[0]}")

echo "Building image"
podman build -t "$name" -f Dockerfile

echo "Creating toolbox"
toolbox create -i "$name" "$name"
