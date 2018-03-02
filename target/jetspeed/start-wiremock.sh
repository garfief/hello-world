#!/bin/bash
echo "Starting wiremock server on http:/localhost:${WIREMOCK_PORT}"
WIREMOCK_PORT="8081"
java -jar /home/coroos/workspace/docker/helloworld/target/wiremock/wiremock-standalone-2.8.0.jar --port ${WIREMOCK_PORT} --root-dir /home/coroos/workspace/docker/helloworld/src/test/resources/ --verbose &

URL="http://localhost:${WIREMOCK_PORT}/__admin/mappings"
CODE="200"
echo "Waiting for ${URL} to return ${CODE}"
while true; do
    STATUS=$(curl -o /dev/null --insecure --silent --get --write-out '%{http_code}' ${URL})
    [[ "${STATUS}" == "${CODE}" ]] && { echo "."; break; }
    echo -n "."
    sleep 1
done
echo "Wiremock server is running at http://localhost:${WIREMOCK_PORT}"