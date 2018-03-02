#!/bin/bash
echo "Compiling..."
mvn clean package -DskipTests

echo "Copying layout to Jetspeed container"
docker cp ${project.build.directory}/jetspeed/decorations/layout/multiply/ jetspeed:/opt/jetspeed/webapps/jetspeed/decorations/layout

echo "Copying Test.psml to Jetspeed container"
docker cp ${project.build.directory}/jetspeed/pages/Test.psml jetspeed:/opt/jetspeed/pages/

echo "Copying ${project.artifactId}-${project.version}.war  to Jetspeed container"
docker cp ${project.build.directory}/${project.artifactId}-${project.version}.war jetspeed:/opt/jetspeed/webapps/jetspeed/WEB-INF/deploy/

echo "Deployment success."
echo "Go to http://localhost:8080/jetspeed/portal/Test.psml"

echo "Tailing Jetspeed container logs"
docker logs -f jetspeed