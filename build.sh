#!/bin/bash
docker stop journal
docker rm journal
docker rmi journal-v1 matveynator/journal-v1
docker build -t journal-v1 .
docker tag journal-v1:latest matveynator/journal-v1:latest
docker push matveynator/journal-v1:latest
