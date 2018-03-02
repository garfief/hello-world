#!/bin/bash
${project.build.directory}/jetspeed/start-wiremock.sh
${project.build.directory}/jetspeed/start-jetspeed.sh
${project.build.directory}/jetspeed/deploy.sh
