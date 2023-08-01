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
                sh 'ls -R $WORKDIR/resources'
                script {
                    sh 'docker run --network host --rm \
                        -v /var/jenkins_home/workspace/test-flyway/resources/db/migration/production/:/flyway/sql \
                        flyway/flyway:9.18.0-alpine -user="$DB_USER" -password="$DB_PASSWORD" -baselineOnMigrate=false -outOfOrder=true -sqlMigrationPrefix=V migrate \
                        -url="jdbc:postgresql://$DB_HOST/$DB_DATABASE"'
                }
            }
        }
    }
}