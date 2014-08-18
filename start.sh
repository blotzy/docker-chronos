#!/bin/bash
sudo docker run -d -p 8080:8080 -p 5050:5050 -p 2181:2181 -p 8081:8081 -P --dns 10.10.4.1 blotzy/chronos
