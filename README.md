# Ping pong
## Helmed Flask with Redis 
### Query ping outputs pong counts 

Use Helm to build Flask apps that query ping to a Redis db (separate pods) and returns pong counts.

In this stage the build will be hard coded installed:

Create the flask-ping deployment
```bash
	mkdir Ping-pong/helm
        helm create flask-ping
```

Copy the existing deploy and service files to the templates directories:
```bash
        cd flask-ping/templates
        cp -p ../../../deploy-flask.yml deployment.yaml
        cp -p ../../../svc-flask.yml service.yaml
```

Create the redis-ping deployment
```bash
        helm create redis-ping
```

Copy the existing deploy and service files to the templates directories:
```bash
        cd redis-ping/templates
        cp -p ../../../deploy-redis.yml deployment.yaml
        cp -p ../../../svc-redis.yml service.yaml
        cp -p ../../../pv.yml .
        cp -p ../../../pvc.yml .
```

```bash
        cd ../..
        pwd     # Ping-pong/helm
        kcf ../ns.yml
```

Install the app:
```bash
        helm install flask-ping ./redis-ping        
        helm install redis-ping ./redis-ping        
```
