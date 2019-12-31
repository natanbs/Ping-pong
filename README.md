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
        kg svc -w
```


