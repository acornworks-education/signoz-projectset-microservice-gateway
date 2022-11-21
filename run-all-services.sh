#!/bin/bash
docker-compose build
docker-compose up -d gateway

cd ..
cd projectset-microservice-frontend
yarn build
docker-compose build
docker-compose up -d frontend

cd ..
cd projectset-microservice-price
docker-compose build
docker-compose up -d price

cd ..
cd projectset-microservice-strategy
./gradlew build
docker-compose build
docker-compose up -d strategy

cd ..
cd projectset-microservice-ticker
./run_docker.sh

cd ..
cd projectset-microservice-gateway