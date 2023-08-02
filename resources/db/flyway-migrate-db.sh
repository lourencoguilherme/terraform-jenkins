#!/usr/bin/env bash

HOST=$1
DATABASE=$2
USER=$3
PASSWORD=$4

docker-compose run --rm \
flyway \
-user=${USER} -password=${PASSWORD} \
-baselineOnMigrate=false -outOfOrder=true -sqlMigrationPrefix=V \
-url="jdbc:postgresql://${HOST}/${DATABASE}" \
migrate \
