# Ping pong
## Helmed Flask with Redis 
### With Helm install Prometheus and Grafana

Use Helm to set Prometheus and Grafana to monitor the Ping-pong application


Add the Helm stable repo
```bash
        helm repo add stable https://kubernetes-charts.storage.googleapis.com
```

Check the list:
```bash
        helm repo list
```
Output:
NAME  	URL
stable	https://kubernetes-charts.storage.googleapis.com

Search for charts:
```bash
        helm search repo 
```

Search for a Prometheus chart:
```bash
        helm search repo prometheus
```

Download the Prometheus and Grafana chart:
```bash
        helm fetch --repo https://kubernetes-charts.storage.googleapis.com --untar --untardir . prometheus
        helm fetch --repo https://kubernetes-charts.storage.googleapis.com --untar --untardir . grafana
```

Install Prometheus and Grafana:
```bash
        helm install prometheus ./prometheus
        helm install grafana ./grafana
```

Set Grafana to use a load balance:
```bash
        sed -i -- 's/type: ClusterIP/type: LoadBalancer/g' grafana/values.yaml
```

Update Helm with the new value in valaues.yaml
```bash
        helm upgrade -f grafana/values.yaml grafana ./grafana
```

Wait for the pending grafana service to get the new IP:
```bash
        kubectl get svc -w
```

Grafan login: Go to the IP of the service:
```bash
        kubectl get svc grafana | grep -v NAME | awk '{print $4}'
```

To reset the admin password:
```bash
        kubectl exec -it grafana_pod grafana-cli admin reset-admin-password new_pass
```

In the Grafana GUI, click on "Add data source".
Select Prometheus
In the URL add: http://prometheus-server.default.svc.cluster.local
Click "Save & Test"

Useful examples of graphs:

Cluster
-------
Cluster CPU
sum(rate(container_cpu_usage_seconds_total[5m]))

Cluster RAM
sum(rate(container_memory_usage_bytes[5m]))

Redis-pv
kube_persistentvolume_capacity_bytes{persistentvolume="redis-pv"}

Redis-pvc
sum(kubelet_volume_stats_used_bytes{persistentvolumeclaim="redis-pvc"})


Namespaces
----------
NS CPU
sum(rate(container_cpu_usage_seconds_total[5m])) by (namespace)

NS RAM
sum(rate(container_memory_usage_bytes[5m])) by (namespace)

NS CPU - default
sum(rate(container_cpu_usage_seconds_total{namespace="default"}[5m])) by (namespace)

NS RAM - default
sum(rate(container_memory_usage_bytes{namespace="default"}[5m])) by (namespace)


Nodes
-----
Nodes CPU requests
sum(kube_pod_container_resource_requests_cpu_cores) by (node)

Nodes RAM requests
sum(kube_pod_container_resource_requests_memory_bytes) by (node)


Containers
----------
Containers CPU
sum(rate(container_cpu_usage_seconds_total[5m])) by (container)

Containers RAM
sum(rate(container_memory_usage_bytes[5m])) by (container)

Containers CPU - Pingpong
sum(rate(container_cpu_usage_seconds_total{container=~"ping.*"}[5m])) by (container)

Containers RAM - Pingpong
sum(rate(container_memory_usage_bytes{container=~"ping.*"}[5m])) by (container)

Containers CPU - System (Not Pingpong)
sum(rate(container_cpu_usage_seconds_total{container!~"ping.*"}[5m])) by (container)

Containers RAM - System (Not Pingpong)
sum(rate(container_memory_usage_bytes{container!~"ping.*"}[5m])) by (container)


PODs
----
PODs CPU
sum(rate(container_cpu_usage_seconds_total[5m])) by (pod_name) 

PODs RAM
sum(rate(container_memory_usage_bytes[5m])) by (pod_name) 

PODs CPU - Flask
sum(rate(container_cpu_usage_seconds_total{pod_name=~"flask.*"}[5m])) by (pod_name) 

PODs RAM - Flask
sum(rate(container_memory_usage_bytes{pod_name=~"flask.*"}[5m])) by (pod_name) 

PODs CPU - Redis
sum(rate(container_cpu_usage_seconds_total{pod_name=~"redis.*"}[5m])) by (pod_name) 

PODs RAM - Redis
sum(rate(container_memory_usage_bytes{pod_name=~"redis.*"}[5m]))
