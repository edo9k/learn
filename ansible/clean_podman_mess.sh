#!/bin/bash

# Stop all running containers
echo "Stopping all running containers..."
podman stop -a

# Remove all containers (forcefully)
echo "Removing all containers..."
podman rm -af

# Remove all images (forcefully)
echo "Removing all images..."
podman rmi -af

# Clean up any additional unused data
echo "Cleaning up system..."
podman system prune -a -f --volumes


# PODMAN CNI NETWORKING BUG/MISCONFIG

#   The CNI configuration is set to version 1.0.0, which is not compatible.
#   It should be version 0.4.0. This requires manual adjustment each time.
#   bug report here: https://bugs.launchpad.net/ubuntu/+source/libpod/+bug/2024394

# Remove the specific network and recreate it
# echo "Removing and recreating the 'podman' network..."
# podman network rm podman 2>/dev/null
# podman network create podman


# Remove any remaining container storage
echo "Cleaning up remaining container storage..."
CONTAINER_ID=$(podman ps -a --filter "name=java_test_container" --format "{{.ID}}")
if [ -n "$CONTAINER_ID" ]; then
    sudo rm -rf /var/lib/containers/storage/overlay/*${CONTAINER_ID}*
    sudo rm -rf /var/lib/containers/storage/overlay-containers/*${CONTAINER_ID}*
    sudo rm -rf /var/lib/containers/storage/volumes/*${CONTAINER_ID}*
fi

# Restart Podman
echo "Restarting Podman..."
sudo systemctl restart podman

echo "Cleanup completed successfully."

