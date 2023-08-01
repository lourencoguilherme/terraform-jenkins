pipeline {
  agent any 
  environment {
    DB_CREDS=credentials('db-creds')
  }

  stages {
    stage("Checkout source") {
        steps {
            git url: 'https://github.com/lourencoguilherme/terraform-jenkins.git', branch: 'main'
            sh 'ls'
        }
    }

    stage('Verify version') {
      steps {
        sh 'docker run --rm flyway/flyway:8.5.1 version'
      }
    }
    stage('migrate') {
      steps {
        sh 'docker run --rm -v $WORKSPACE/resources/db/migration/production:/flyway/sql -v $WORKSPACE/resources/db/conf:/flyway/conf flyway/flyway:8.5.1 -user=$DB_CREDS_USR -password=$DB_CREDS_PSW migrate'
      }
    }
    stage('validate') {
      steps {
        sh 'docker run --rm -v $WORKSPACE/resources/db/migration/production:/flyway/sql -v $WORKSPACE/resources/db/conf:/flyway/conf flyway/flyway:8.5.1 -user=$DB_CREDS_USR -password=$DB_CREDS_PSW validate'
      }
    }
    stage('info') {
      steps {
        sh 'docker run --rm -v $WORKSPACE/resources/db/migration/production:/flyway/sql -v $WORKSPACE/resources/db/conf:/flyway/conf flyway/flyway:8.5.1 -user=$DB_CREDS_USR -password=$DB_CREDS_PSW info'
      }
    }
  }
}