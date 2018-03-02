#!/bin/bash
/home/coroos/workspace/docker/helloworld/target/jetspeed/stop.sh
mvn clean install -DskipTests
/home/coroos/workspace/docker/helloworld/target/jetspeed/start.sh
