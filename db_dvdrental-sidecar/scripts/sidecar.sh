#!/bin/bash

echo "Starting sidecar application: ${SPRING_APPLICATION_NAME}"
java -jar -Dspring.application.name=${SPRING_APPLICATION_NAME} /opt/asimio-cloud/sidecar.jar &
