# cdk-2-runner

node 16 base image, with
- aws-cdk-local (localstack)
- aws-cdk

Optionally start the ready endpoint from your entry point.  Please note this will keep your container running.  This might be desirable if running from docker compose.
```
sh /setup/ready.sh
```

## Docker Hub
https://hub.docker.com/r/roonga/cdk-2-runner

## Sample Usage:

### Dockerfile
```
FROM roonga/cdk-2-runner:latest
WORKDIR /cdk
COPY ./<your cdk code> . 
ENTRYPOINT ["sh","deploy.sh"]
```

### deploy.sh (For LocalStack)

deploy to localstack and start the ready endpoint( optional ), indicating your cdk deploy is complete at http://localhost/ready 

```
#!/bin/bash -x

npm ci

cdklocal bootstrap

cdklocal deploy 

# start http health endpoint from the base image
sh /setup/ready.sh
```

### deploy.sh (For AWS Cloud)

deploy to localstack and start the ready endpoint (optional), indicating your cdk deploy is complete at http://localhost/ready 

```
#!/bin/bash -x

npm ci

cdk deploy 

# start http health endpoint from the base image
sh /setup/ready.sh
```
