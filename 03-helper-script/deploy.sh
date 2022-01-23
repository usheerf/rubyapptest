#!/bin/bash
echo "======================="
echo "Local deployment starting now"
echo "======================="
git clone https://github.com/usheerf/rubyapptest
sleep 10
echo "======================="
echo "Git clone successed"
echo "======================="
echo "======================="
echo "Lets start minikube"
echo "======================="
cd rubyapptest/02-K8
minikube start
echo "======================="
echo "Minikube started successfully"
echo "======================="
kubectl apply -f deployment.yaml
sleep 30
echo "======================="
echo "Pods are getting created"
kubectl gte pods
echo "======================="
echo "=============================================="
echo "Feel free exist the script manaully after verification"
echo "=============================================="
minikube service rubyapp
