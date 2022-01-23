# Ruby Application Deployment


### Docker command

Steps to build docker image

- cd `cd 01-Docker` 
- Run the below set of commands
  - `docker build -t usheerfotedar/rubyapptest-v1 .`
  - Optional : Pushing the docker image to docker hub. I have already pushed this image hence we can re-use the same
    - To push the docker image `docker push usheerfotedar/rubyapptest-v1`
  - `docker run -p 80:80 usheerfotedar/rubyapptest-v1`
- Open `localhost:80` and `localhost:80/healthcheck` for validating the ruby application.
- This confirms that image is working fine.

### K8's Deployment
- Pre-requists : Minikube / Docker on local system
- Our version during this development 
  - Minikube
  - Docker
- Create minikube cluster `minikube start`
- Create minikube tunnel `minikube tunnel` leave this terminal running and don't close
- Open a new terminal and `cd 02-k8` 
- Deploy the application by running `kubectl apply -f deployment.yaml`
- When you apply the above minikube will ask the permission to open port 80 hence vist the other terminal that was open and give your password 
- **Note** : This is happening on the latest minikube version we have. If you are using the old version this might not be the case.
- Expose the service now with `minikube service rubyapp`
- Open `localhost:80` and `localhost:80/healthcheck` for validating the ruby application. It might take 2-3 mins for this to be exposed.
- **Minikube Dashboard** If you wish to monitor k8's then open another terminal and run `minkube dashboard` and keep it running.

### Issue identified during the test
- Looks like we get an error around the ruby `healthcheck` when using readinessprobe. Hence building a new image with changed ruby code.

- The kubernetes pod's readiness probe was failing when we did 
`kubectl describe pod <pod_name>` , we saw the below error

```
 Warning  Unhealthy  2s (x8 over 37s)  kubelet            Readiness probe failed: Get "http://172.17.0.6:80/healthcheck": net/http: HTTP/1.x transport connection broken: malformed HTTP response "OK"
```


### Future improvement 
- 