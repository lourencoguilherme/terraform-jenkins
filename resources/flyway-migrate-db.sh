#!/usr/bin/env bash

HOST=$1
DATABASE=$2
USER=$3
PASSWORD=$4

cd "${PWD}"/resources

ls

docker run --rm \
-v "./db/migration/production/:/flyway/sql \
flyway/flyway:9.18.0-alpine -user=${USER} -password=${PASSWORD} -baselineOnMigrate=false -outOfOrder=true -sqlMigrationPrefix=V migrate \
-url="jdbc:postgresql://${HOST}/${DATABASE}"
