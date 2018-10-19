#!/usr/bin/env bash

microk8s.enable dns dashboard
microk8s.kubectl proxy &

microk8s.enable registry

microk8s.docker build -t localhost:32000/jenkins:1.0 jenkins
microk8s.docker push localhost:32000/jenkins:1.0

microk8s.docker build -t localhost:32000/jenkins-slave:1.0 jenkins-slave
microk8s.docker push localhost:32000/jenkins-slave:1.0

microk8s.kubectl apply -f ./jenkins/jenkins-serviceaccount.yaml
microk8s.kubectl apply -f ./jenkins/jenkins-config.yaml
microk8s.kubectl apply -f ./jenkins/jenkins-deployment.yaml