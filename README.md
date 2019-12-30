# Ping pong
## Helmed Flask with Redis 
### Query ping outputs pong counts 

Use Helm to build Flask apps that query ping to a Redis db (separate pods) and returns pong counts.

Implement Helm templates:

The templates are in the key:value format where the key is taken from the template and the value from the values.yaml

The templates are placed under:

```bash
        Ping-pong/helm/<app>/templates
```

The values are taken from the valies.yaml file:
```bash
        Ping-pong/helm/<app>/values.yaml
```

Example of a template formats:

```bash
        name: {{ .Values.name }}
```

- .Values: The vlaues.yaml file
- .name: Taken from the name key in the values.yaml file.

In values.yaml you will find:
```bash
        name: my-deploy
```
The template above will take "my-deploy" for {{ .Values.name }}

Another example:
In the template 
```bash
        type: {{ .Values.service.type }}
```

In values.yaml you can find:

```bash
        service:
          type: LoadBalancer
```

So in values.yaml you will find:
- .Values: The vlaues.yaml file
- .service: The key 
- .type: The value: Loadbalancer

In this case the template will take the LoadBalancer as the service type from the values.yaml file.

