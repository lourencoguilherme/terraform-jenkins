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
                USER = credentials('DB_USER')
                PASSWORD = credentials('DB_PASSWORD')
                DATABASE = credentials('DB_DATABASE')
                HOST = credentials('DB_HOST')
            }
            steps {
                script {
                    dir('resources') {
                        sh 'docker run --network host --rm -v "./db/migration/production/:/flyway/sql" flyway/flyway:9.18.0-alpine -user="$USER" -password="$PASSWORD" -baselineOnMigrate=false -outOfOrder=true -sqlMigrationPrefix=V migrate -url="jdbc:postgresql://$HOST/$DATABASE"' 
                    }
                }
            }
        }
    }
}