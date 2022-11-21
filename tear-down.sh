#!/bin/bash

cd ..
cd projectset-microservice-frontend
docker-compose down

cd ..
cd projectset-microservice-price
docker-compose down

cd ..
cd projectset-microservice-strategy
docker-compose down

cd ..
cd projectset-microservice-ticker
docker-compose down

cd ..
cd projectset-microservice-gateway
docker-compose down