#!/bin/bash
echo "Compiling..."
mvn clean package -DskipTests

echo "Copying layout to Jetspeed container"
docker cp /home/coroos/workspace/docker/helloworld/target/jetspeed/decorations/layout/multiply/ jetspeed:/opt/jetspeed/webapps/jetspeed/decorations/layout

echo "Copying Test.psml to Jetspeed container"
docker cp /home/coroos/workspace/docker/helloworld/target/jetspeed/pages/Test.psml jetspeed:/opt/jetspeed/pages/

echo "Copying hello-world-1.0-SNAPSHOT.war  to Jetspeed container"
docker cp /home/coroos/workspace/docker/helloworld/target/hello-world-1.0-SNAPSHOT.war jetspeed:/opt/jetspeed/webapps/jetspeed/WEB-INF/deploy/

echo "Deployment success."
echo "Go to http://localhost:8080/jetspeed/portal/Test.psml"

echo "Tailing Jetspeed container logs"
docker logs -f jetspeed