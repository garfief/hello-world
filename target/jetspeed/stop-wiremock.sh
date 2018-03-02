#!/bin/bash
echo "Stopping Wiremock server"
curl -X POST http://localhost:8081/__admin/shutdown