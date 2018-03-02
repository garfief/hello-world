#!/bin/bash
${project.build.directory}/jetspeed/stop.sh
mvn clean install -DskipTests
${project.build.directory}/jetspeed/start.sh
