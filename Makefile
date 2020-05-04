#! /usr/bin/make
#
# Makefile for everis test 
#

CLUSTER := demo-cluster
PROJECT := ninth-bonito-276003
IMAGE := everistest

create_cloud:
	@cd terraform && \
	terraform init && \
	terraform apply 

create_image:
	@cd app && \
	docker build -t ${IMAGE} . && \
	gcloud auth configure-docker && \
	docker tag ${IMAGE} "gcr.io/${PROJECT}/${IMAGE}:tag1" && \
	docker push "gcr.io/${PROJECT}/${IMAGE}:tag1"

deploy:
	gcloud container clusters get-credentials ${CLUSTER} --region us-central1 --project ${PROJECT} &&\
	kubectl apply -f k8/deployment.yaml && \
	kubectl apply -f k8/service.yaml && \
	kubectl apply -f k8/ingress.yaml

destroy_cloud:
	@cd terraform && \
	terraform destroy