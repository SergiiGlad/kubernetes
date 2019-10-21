## Running a MongoDB Database in Kubernetes with StatefulSets

https://codelabs.developers.google.com/codelabs/cloud-mongodb-statefulset/index.html?index=..%2F..index#7

To set up the MongoDB replica set, you need three things: A StorageClass, a Headless Service, and a StatefulSet.

## Using Kubernetes Engine to Deploy Apps with Regional Persistent Disks

https://cloud.google.com/solutions/using-kubernetes-engine-to-deploy-apps-with-regional-persistent-disks

### Simulating a zone failure

Simulate a zone failure by deleting the instance group for the node where the WordPress pod is running

## Kubernetes Tips: Using a ServiceAccount

https://medium.com/better-programming/k8s-tips-using-a-serviceaccount-801c433d0023

```
TOKEN=$(cat /run/secrets/kubernetes.io/serviceaccount/token)
curl -H “Authorization: Bearer $TOKEN” https://kubernetes/api/v1/ --insecure
```


