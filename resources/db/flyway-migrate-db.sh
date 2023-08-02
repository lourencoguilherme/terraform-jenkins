#!/usr/bin/env bash

HOST=$1
DATABASE=$2
USER=$3
PASSWORD=$4

docker run --rm \
-v "${PWD}"/db/migration/production:/flyway/sql \
flyway/flyway:9.18.0-alpine -user=${USER} -password=${PASSWORD} -baselineOnMigrate=false -outOfOrder=true -sqlMigrationPrefix=V migrate \
-url="jdbc:postgresql://${HOST}/${DATABASE}"