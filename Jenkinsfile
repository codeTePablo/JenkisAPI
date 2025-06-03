pipeline {
    agent any

    stages {
        stage('Clonar repositorio') {
            steps {
                git 'https://github.com/codeTePablo/JenkisAPI.git'
            }
        }

        stage('Construir imagen Docker') {
            steps {
                sh '''
                    docker rm -f flask-api || true
                    docker rmi flask-api || true
                    docker build -t flask-api .
                '''
            }
        }

        stage('Ejecutar contenedor') {
            steps {
                sh 'docker run -d -p 5000:5000 --name flask-api flask-api'
            }
        }
    }
}
