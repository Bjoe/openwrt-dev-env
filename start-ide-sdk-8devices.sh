#!/bin/bash
export DOCKER_IMAGE=openwrt-8devices-sdk-ide
export DOCKER_CONTAINER=compose_openwrt-8devices-sdk-ide_run_1
export DOCKER_COMPOSE_FILE=docker-compose-8devices.yml
./scripts/run.sh $@
