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
                dir('resources/db') {
                    script {
                        sh './flyway-migrate-db.sh dev "$DB_HOST" "$DB_DATABASE" "$DB_CREDS_USR" "$DB_CREDS_PSW" "$WORKSPACE"'
                    }
                }
            }
        }
    }
}