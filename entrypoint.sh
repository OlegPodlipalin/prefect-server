#!/bin/bash
set -e

# Start the worker in the background
prefect worker start my-pool &

# Start the Prefect server
exec prefect server start
