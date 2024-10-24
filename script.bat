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
                bat 'java -jar myJar.jar'
            }
        }
        stage('Artifact'){
            steps{
                archiveArtifacts artifacts: '*.jar', followSymlinks: false
            }
        }
    }
}
