#!/bin/bash
set -e

wait_for_server() {
  while ! curl -sSf ${PREFECT_UI_URL}/health > /dev/null; do
    echo "Waiting for Prefect server to be available..."
    sleep 5
  done
}

prefect server start &

wait_for_server

prefect work-pool create --type docker ${PREFECT_DOCKER_WORKPOOL} || true
prefect worker start --pool ${PREFECT_DOCKER_WORKPOOL} &

wait