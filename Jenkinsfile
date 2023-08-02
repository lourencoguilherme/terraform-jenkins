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
                DB_KEY = credentials('DB_KEY')
            }
            steps {
               flywayRunner {
                    name('flyway')
                    command('migrate')
                    url('jdbc:postgresql://${HOST}/${DATABASE}')
                    locations('filesystem:$WORKSPACE/resources/db/migration/production')
                    credentialsId('$DB_KEY')
                }
            }
        }
    }
}