#!/bin/bash

docker-compose -f "./.dev_env/docker-compose.yml" --env-file "./.dev_env/config.env" up -d