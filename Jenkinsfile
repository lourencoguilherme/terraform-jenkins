pipeline {
    agent any

    stages {

        stage("Checkout source") {
            steps {
                git url: 'https://github.com/lourencoguilherme/terraform-jenkins.git', branch: 'main'
                sh 'ls'
            }
        }

        stage('Execução flyway') {
            environment {
                DB_CREDS=credentials('DB_CREDS')
                DB_HOST = credentials('DB_HOST')
                DB_DATABASE = credentials('DB_DATABASE')
            }
            steps {
                sh 'docker run --rm -v $WORKSPACE/resources/db/migration/production:/flyway/sql -v $WORKSPACE/resources/db/flyway/dev:/flyway/conf flyway/flyway:8.5.1 -url="jdbc:postgresql://${DB_HOST}/${DB_DATABASE}" -user=$DB_CREDS_USR -password=$DB_CREDS_PSW migrate'
            }
        }
    }
}