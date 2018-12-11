#!/usr/bin/env bash

mkdir -p /usr/local/etc/sprawdzarka/mysql
mkdir -p /usr/local/etc/sprawdzarka/tmp
docker run -d -p 3306:3306 -v /usr/local/etc/sprawdzarka/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=app_db --name mysql mysql:latest
docker run -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock -v /usr/local/etc/sprawdzarka/tmp:/usr/local/etc/API/temp -e TMP_PATH="/usr/local/etc/sprawdzarka/tmp" --name compilebox kamilbreczko/sprawdzarka:compilebox
docker run -d --network host --name backend kamilbreczko/sprawdzarka:back-end
docker run --network host --name frontend kamilbreczko/sprawdzarka:front-end
