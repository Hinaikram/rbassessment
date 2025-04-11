#!/bin/bash

set -e

RELEASE_NAME=springboot-app
NAMESPACE=default
CHART_DIR=./springboot-app

echo "Deploying Spring Boot App Helm chart..."

helm upgrade --install $RELEASE_NAME $CHART_DIR --namespace $NAMESPACE

echo "Deployment complete."
