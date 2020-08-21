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
            steps {
                echo 'Deploying....'
            }
        }
    }
}
