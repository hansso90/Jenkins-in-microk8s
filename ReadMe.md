# Jenkins on K8s

## Jenkins on microk8s:

#### Deploy jenkins on microk8s

1. we want to see what we are doing, so spin up the dashboard
```
microk8s.enable dns dashboard
microk8s.kubectl proxy
```
now serving to http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy

2. We trying to push or own docker images so we need a registry
```
microk8s.enable registry
```

3. Build de images en push them to the registry:
```
# Build images en push to registry of microk8s
microk8s.docker build -t localhost:32000/jenkins:1.0 jenkins
microk8s.docker push localhost:32000/jenkins:1.0

microk8s.docker build -t localhost:32000/jenkins-slave:1.0 jenkins-slave
microk8s.docker push localhost:32000/jenkins-slave:1.0
```

4. spin up jenkins deployment:
```
microk8s.kubectl apply -f ./jenkins/jenkins-serviceaccount.yaml
microk8s.kubectl apply -f ./jenkins/jenkins-config.yaml
microk8s.kubectl apply -f ./jenkins/jenkins-deployment.yaml

```

After deploying on k8s, port-forward jenkins to your system.
```
microk8s.kubectl port-forward svc/jenkins 9000
```
With http://localhost:9000 you could connect to jenkins


Setup k8s on jenkins in `configure system`
```
# get service ip van kubernetes
kubectl cluster-info | grep master #e.g. local-ip:8080

# search for the ip from pod `jenkins`
kubectl get pods | grep jenkins #e.g. jenkins-5fdbf5d7c5-dj2rq
kubectl describe pod jenkins-5fdbf5d7c5-dj2rq #e.g. 10.1.1.117:8080
```

add new cloud:





