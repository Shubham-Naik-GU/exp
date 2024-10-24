pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                bat 'javac Hello.java'
            }
        }
        stage('Jar') {
            steps {
                bat 'jar cfe myJar.jar Hello Hello.class'
            }
        }
        stage('Run') {
            steps {
                script {
                    def output = bat(script: 'java -jar myJar.jar', returnStdout: true).trim()
                    echo output
                }
            }
        }
        stage('Artifact') {
            steps {
                archiveArtifacts artifacts: '*.jar', followSymlinks: false
            }
        }
    }
}
