# Ping pong
## Kubernated Flask with Redis 
### Query ping outputs pong counts 

Kubernates pod with a Flask app that query ping to a Redis db and returns pong counts.

To run the app run the commands:

```bash
	kubectl create -f deploy.yml
```

To check the service IP:
```bash
        kubectl get svc | grep svc | awk '{print $4}
```

After the containers are up and running, go to the url:

[http://{IP}:5000/ping](http://localhost:5000/ping)
