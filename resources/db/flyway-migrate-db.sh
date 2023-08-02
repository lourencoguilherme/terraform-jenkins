#!/usr/bin/env bash

ENV=$1
HOST=$2
DATABASE=$3
USER=$4
PASSWORD=$5
WORKSPACE=$6

docker-compose run --rm \
flyway \
-v "${WORKSPACE}"/db/migration/:/flyway/sql \
-user=${USER} -password=${PASSWORD} \
-baselineOnMigrate=false -outOfOrder=true -sqlMigrationPrefix=V \
-url="jdbc:postgresql://${HOST}/${DATABASE}" \
migrate \
