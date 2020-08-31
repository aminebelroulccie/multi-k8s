#!/usr/bin/env bash
docker build -t aminebelroulccie/multi-client:latest -t aminebelroulccie/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t aminebelroulccie/multi-server:latest -t aminebelroulccie/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t aminebelroulccie/multi-worker:latest -t aminebelroulccie/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push aminebelroulccie/multi-client:latest
docker push aminebelroulccie/multi-server:latest
docker push aminebelroulccie/multi-worker:latest

docker push aminebelroulccie/multi-client:$SHA
docker push aminebelroulccie/multi-server:$SHA
docker push aminebelroulccie/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=aminebelroulccie/multi-client:$SHA
kubectl set image deployments/server-deployment server=aminebelroulccie/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=aminebelroulccie/multi-worker:$SHA


