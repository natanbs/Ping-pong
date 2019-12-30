#!/bin/bash
kubectl create -f ns.yml 
kubectl create -f pv.yml 
kubectl create -f pvc.yml 
kubectl create -f svc-redis.yml 
kubectl create -f deploy-redis.yml 
kubectl create -f svc-flask.yml 
kubectl create -f deploy-flask.yml
echo
echo
kubectl get all -o wide -n ping-ns
