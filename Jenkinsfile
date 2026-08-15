pipeline {
    agent {
        label 'cartforge-agent'
    }

    stages {

        stage('Clone Source Code') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                dir('app') {
                    sh 'npm install'
                }
            }
        }

        stage('Build Application') {
            steps {
                dir('app') {
                    sh 'npm run build'
                }
            }
        }

        stage('Run Tests') {
            steps {
                dir('app') {
                    sh 'npm test'
                }
            }
        }

        stage('Package Application') {
            steps {
                sh '''
                    rm -rf cartforge-artifact
                    mkdir -p cartforge-artifact
                    cp -r app/dist cartforge-artifact/
                    cp app/package.json cartforge-artifact/
                '''
            }
        }

        stage('Deliver Artifact') {
            steps {
                archiveArtifacts artifacts: 'cartforge-artifact/**', fingerprint: true
            }
        }
    }

    post {
        success {
            echo 'CartForge Pipeline completed successfully!'
        }

        failure {
            echo 'CartForge Pipeline failed.'
        }
    }
}
