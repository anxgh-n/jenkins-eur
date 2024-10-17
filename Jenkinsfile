pipeline {
    agent any

    tools{
        maven 'my-maven'
        jdk 'my-jdk'
    }

    stages {
        stage('Git') {
            steps {
                echo 'Pull code from github'
                git url : 'https://github.com/anxgh-n/jenkins-eur.git',branch:'master'
            }
        }
        stage('Build') {
            steps {
                echo 'Build project using maven'
                bat "mvn clean install -DskipTests"
            }
        }
        stage('Test') {
            steps {
                echo 'Test your application'
                bat "mvn test"
            }
        }
        stage('Deploy'){
            steps{
                echo 'Deploy the project'
                bat 'docker rm -f eureka-container || true'
                bat 'docker rmi -f eureka-image || true'
                bat 'docker build -t eureka-image .'
                bat 'docker run --network eureka-network -p 8761:8761 -d --name eureka-container eureka-image'
            }
        }
    }
}
