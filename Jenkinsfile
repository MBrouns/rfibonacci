pipeline {
    agent {
    	docker {
    	    image 'rocker/r-ver:4.0.0'
                args '-u 0:0'
    	}
    }
    stages {
        stage('Build') {
            steps {
          	sh '''
            apt-get update -qq && apt-get -y --no-install-recommends install libgit2-dev libssl-dev libxml2-dev libcurl4-openssl-dev libssh2-1-dev unixodbc-dev libsasl2-dev
         		Rscript -e "install.packages('renv')"
        		Rscript -e "renv::init()"
        		Rscript -e "renv::restore(repos = 'https://packagemanager.rstudio.com/all/__linux__/focal/latest')"
        		Rscript -e "install.packages('devtools')"
        		Rscript -e "install.packages('.', repos = NULL)"
        		'''
	          }
        }
        stage('Test') {
            steps {
            	sh '''
          		Rscript -e "devtools::check()"
          		'''
          	 }
        }
        stage('Deploy') {
            agent any
            steps {
                sh '''
                docker build -t eu.gcr.io/xccelerated-main/from-jenkins:latest .
                docker push
                '''
            }
        }
    }
}
