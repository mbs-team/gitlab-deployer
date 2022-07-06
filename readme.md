```bash
Login into the docker hub account.   
docker login --username=<user-name>
```

Create a new image based on linux/amd64. 
Tag the build with the right node version (see DockerFile).  
```bash
docker build --platform linux/amd64 -t mbsteam/nodejs-azurecli-sshagent:node-18 .
```
this might take a while.  

Push the new image to the repo with the right tag.  
```bash
docker push mbsteam/nodejs-azurecli-sshagent:node-18
```

change the image in the root of .gitlab-ci.yml to the tagged one.   