#!/bin/bash

kubectl delete deploy flask-deploy -n ping-ns
kubectl delete deploy redis-deploy -n ping-ns
kubectl delete svc flask-svc -n ping-ns
kubectl delete svc redis-svc -n ping-ns

echo
echo
kubectl get all -o wide -n ping-ns
