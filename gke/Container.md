# Google codelabs

https://codelabs.developers.google.com/codelabs/cloud-hello-kubernetes/index.html#0

## install the command ```kubectl```

```sh
gcloud components install kubectl
```


## Create a Kubernetes cluster

```
$ gcloud config set project PROJECT_ID

$ gcloud container clusters create hello-world \
                --num-nodes 3 \
                --machine-type n1-standard-1 \
                --zone us-central1-f

```

List your Container Registry repository
```
$ gcloud container images list
```

Resizing cluster
```
gcloud beta container clusters resize standard-cluster-1 \
--node-pool default-pool \
--region=us-central1 \
--num-nodes 0
```

Delete your cluster 

```
$ gcloud container clusters delete hello-world --zone=us-central1-f
```


