#!/bin/bash
set -e

# Start the worker in the background
prefect prefect worker start --pool drunkmaster

# Start the Prefect server
prefect server start
