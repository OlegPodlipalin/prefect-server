#!/bin/bash
set -e

# Function to check if Prefect server is up
wait_for_server() {
  while ! curl -sSf http://127.0.0.1:4200/api/health > /dev/null; do
    echo "Waiting for Prefect server to be available..."
    sleep 5
  done
}

# Start the Prefect server
prefect server start &

# Wait for the Prefect server to be ready
wait_for_server

# Create a working pool (this writes to the database)
prefect work-pool create --type docker drunkmaster || true

# Start the worker in the background
prefect worker start --pool drunkmaster &
