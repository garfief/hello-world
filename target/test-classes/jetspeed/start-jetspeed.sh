#!/bin/bash
WIREMOCK_PORT="8081"
WIREMOCK_HOST=${WIREMOCK_HOST:-"172.17.0.1"}

echo "Removing previous container"
docker rm -f jetspeed

#-e MMI_REWARDS_CALCULATOR_URL=http://${WIREMOCK_HOST}:${WIREMOCK_PORT}/multiply-product-rewards-impl/rest/mapping/calculator \

echo "Creating new Jetspeed Docker container"
docker run --name jetspeed -p 8080:8080 -p 8000:8000 -d \
	-e MMI_TEMPLATERESOLVER_CLASS=org.thymeleaf.templateresolver.FileTemplateResolver \
	-e MMI_TEMPLATERESOLVER_PREFIX=/opt/jetspeed/templates/ \
	-e MMI_TEMPLATERESOLVER_CACHEABLE=false \
	-v ${project.basedir}/src/main/webapp/WEB-INF/templates/:/opt/jetspeed/templates/ \
	andreoosthuizen/jetspeed:latest /opt/jetspeed/bin/catalina.sh jpda run

echo "Waiting for Jetspeed portal to start"
URL="http://localhost:8080/jetspeed/portal/Test.psml"
CODE="200"
while true; do
    STATUS=$(curl -o /dev/null --insecure --silent --head --write-out '%{http_code}' ${URL})
    [[ "${STATUS}" == "${CODE}" ]] && { echo "."; break; }
    echo -n "."
    sleep 1
done
echo "Jetspeed server is running at ${URL}"
