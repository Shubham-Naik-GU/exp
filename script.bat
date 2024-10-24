pipeline {
    agent any
    stages {
        stage('Clean workspace and Navigate to the folder'){
            steps{
                cleanWs()
                bat 'copy C:\\\\Users\\\\GBS\\\\Desktop\\\\java "C:\\Users\\GBS\\AppData\\Local\\Jenkins\\.jenkins\\workspace\\piper"'
            }
        }
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