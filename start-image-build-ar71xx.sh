#!/bin/bash
export DOCKER_IMAGE=openwrt-image-build-ar71xx
export DOCKER_CONTAINER=compose_openwrt-image-build-ar71xx_run_1
export DOCKER_COMPOSE_FILE=docker-compose.yml
./scripts/run.sh $@
