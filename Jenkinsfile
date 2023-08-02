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
                DB_USER = credentials('DB_USER')
                DB_PASSWORD = credentials('DB_PASSWORD')
                DB_DATABASE = credentials('DB_DATABASE')
                DB_HOST = credentials('DB_HOST')
            }
            steps {
                dir('resources/db') {
                    script {
                        sh './flyway-migrate-db.sh "$DB_HOST" "$DB_DATABASE" "$DB_USER" "$DB_PASSWORD"'
                    }
                }
            }
        }
    }
}