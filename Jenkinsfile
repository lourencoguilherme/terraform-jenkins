pipeline {
    agent any

    stages {

        stage("Checkout source") {
            steps {
                git url: 'git@github.com:lourencoguilherme/terraform-jenkins.git', branch: 'main'
                sh 'ls'
            }
        }

        stage('Execução do projeto Terraform') {
            steps {
                script {
                    dir('resources') {
                        sh 'docker run --rm \
                            -v "db/migration/production/:/flyway/sql \
                            flyway/flyway:9.18.0-alpine -user=postgres -password=postgres -baselineOnMigrate=false -outOfOrder=true -sqlMigrationPrefix=V migrate \
                            -url="jdbc:postgresql://host.docker.internal:5432/poc"'
                    }
                }
            }
        }
    }
}