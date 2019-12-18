#!/bin/bash
kubectl create -f svc-redis.yml -f svc-flask.yml -f deploy-redis.yml -f deploy-flask.yml
echo
echo
kubectl get all -o wide
