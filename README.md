# Ping pong
## Containerized Flask Application 

A containerized Flask app that returns pong to a ping request.

To run the app run the commands:

```bash
	docker build -t flask-ping:latest .                      # Build the docker image
	docker run -d -p 5000:5000 --name Ping-flask flask-ping  # Run the Flask container
```

After the application is running go to the url:

[http://localhost:5000/ping](http://localhost:5000/ping)
