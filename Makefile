iac:
	docker build -t devops .
	docker run --name devops -it --rm -v ./infra:/shared devops /bin/bash


