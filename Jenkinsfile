pipeline{
    agent any
    stages{
        stage('AWS docker login'){
            steps{
            sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 047032559530.dkr.ecr.us-east-1.amazonaws.com'
            }
        }
        stage('Use Context'){
            steps{
                sh 'docker context use capstone_ecs'
            }
        }
        stage('AWS Login') {
			steps{
                sh './aws_login.sh'
				}
			}
        stage('Apply yaml'){
            steps{
                sh "docker compose -f docker-compose/docker-compose-${SERVICE_TO_UPDATE}.yaml -p capstone-ecs up"
            }
        }
        stage('switch back context'){
            steps{
                sh "docker context use default"
            }
        }
    }
}