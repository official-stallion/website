# Deployment

The final step is deployment. If you have your application docker image, you can
deploy it on everything. A VM, AWS servers, Google clusters and etc. 

If we want to deploy our Golang applications, Kubernetes is perfect for us.

To deploy a Golang project on Kubernetes cluster, you can do it in three ways.

### With a Pod 
You can deploy it with a single pod creation:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: k8s-golang
  labels:
    name: k8s-golang
spec:
  containers:
  - name: k8s-golang-container
    image: amirhossein21/k8s-golang:latest
    resources:
      limits:
        memory: "128Mi"
        cpu: "500m"
    ports:
      - containerPort: 8080
        protocol: TCP
```

### Deploy with Service 
A better way is to use deployment and servie config for Kubernetes. This allows you to manage
your pod easily.
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: k8s-golang
  labels:
    app: k8s
spec:
  replicas: 3
  selector:
    matchLabels:
      app: k8s
  template:
    metadata:
      labels:
        app: k8s
    spec:
      containers:
      - name: k8s
        image: amirhossein21/k8s-golang
        ports:
        - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: k8s
spec:
  type: LoadBalancer
  selector:
    app.kubernetes.io/name: k8s
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
```

### Using Helm Charts
If you use Helm Charts, all files will be generated automatically.
I think the best way is to use helm charts.

Create:
```shell
helm create [PROJECT NAME]
```

Deploy:
```shell
helm install [HELM DIRECTORY]
```
