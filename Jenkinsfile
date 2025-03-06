pipeline {
    agent any

    tools {
        maven "Maven3"
    }

    environment {
        NEXUS_URL = 'http://104.198.235.133:8081/repository/maven-releases/'
        NEXUS_CREDENTIALS_ID = 'nexus-cred'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/reethuo/simple-java-maven-app.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Publish to Nexus') {
            steps {
                sh """
                mvn deploy -DaltDeploymentRepository=nexus-releases::default::${NEXUS_URL} \
                --settings /etc/maven/settings.xml
                """
            }
        }
    }

    post {
        success {
            echo 'Build and Deployment Successful!'
        }
        failure {
            echo 'Build Failed!'
        }
    }
}
