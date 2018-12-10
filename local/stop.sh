#!/usr/bin/env bash
docker stop mysql
docker stop compilebox
docker stop backend

docker rm mysql
docker rm compilebox
docker rm backend
