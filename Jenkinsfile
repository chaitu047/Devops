pipeline {
    agent any
    tools {
        maven 'MAVEN3'
        jdk 'OracleJDK11'
    }

    stages {

        stage('Fetch code from git') {
            steps {
                git branch: 'main', url: 'https://github.com/chaitu047/vprofile-project.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn install -DskipTests'
            }

            post {
                success {
                    echo 'Archiving artifacts now.'
                    archiveArtifacts artifacts: '**/*.war'
                }
            }
        }

        stage('Unit Tests') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Checkstyle code analysis') {
            steps {
                sh 'mvn checkstyle:checkstyle'
            }
        }
    }
}