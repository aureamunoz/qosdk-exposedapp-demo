#!/bin/sh

rm -rf /home/amunozhe/demos/exposedapp
kind delete cluster
docker rm -f $(docker ps -aq)
./kind-reg-ingress.sh
export JOSDK_WATCH_CURRENT=development
kubectl create namespace development
kubectl config set-context --current --namespace=development

