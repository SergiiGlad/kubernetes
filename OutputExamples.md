
# output last terminated reason not null (Error OOMKilled)

<https://medium.com/google-cloud/bash-hacks-gcloud-kubectl-jq-etc-c2ff351d9c3b>

kubectl  get po  -n namespaces -o json \
  | jq '.items[].status.containerStatuses[].lastState.terminated.reason' \
  | grep -v null


# name all pod


kubectl  get po  --all-namespaces \
-o go-template --template='{{range .items}}{{printf "%s \n" .metadata.name }}{{end}}'

kubectl get po --all-namespaces --sort-by=.metadata.name


# metadata  pod 1

kubectl get po  --all-namespaces -o json | jq '.items[1]'

kubectl get po --all-namespaces -o jsonpath='{.spec[48]}'  dashboard-settings-7d7597d89f-44k4c


# list pods sorted by restart config_out


kubectl get po --all-namespaces  --sort-by='status.containerStatuses[0].restartCount'


# go template with index

kubectl  get po  --all-namespaces  \
-o go-template --template='{{with index  .items 48}}{{}} {{printf "%s %s \n" .metadata.name .status}}{{end}}'

kubectl  get po  --all-namespaces  -o go-template --template='
{{with index .items 48}}
{{printf "%s " .metadata.name }}
  {{range .status.containerStatuses }}
           {{printf "%s \n" .terminated }}
    {{end}}
  {{end}}
{{end}}'


kubectl  get po  --all-namespaces  -o go-template --template='
{{with index .items 48}}
  {{printf "%s " .metadata.name }}
    {{ range .status.containerStatuses}}
        {{if .lastState}}
           {{printf "%s \n" .lastState.terminated.reason}}
          {{end}}
    {{end}}
{{end}}'

kubectl get po --all-namespaces  -o go-template --template='
{{range .items }}
  {{$name := .metadata.name}}
  {{$namespace := .metadata.namespace}}
  {{$nodeName := .spec.nodeName}}
  {{$phase := .status.phase }}
      {{ range .status.containerStatuses}}
        {{if .lastState}}
             {{printf "%15s %35s %15s %15s %10s %10.f %s\n" $name $namespace $nodeName .lastState.terminated.reason .lastState.terminated.finishedAt .restartCount $phase}}
          {{end}}
    {{end}}
{{end}}'


## map[string]interface {}

``` 
kubectl get node/gke-gke-px-default-pool-0fa51c7f-gf4g -o json
```
{ \
    "apiVersion": "v1", \
    "kind": "Node", \
    "metadata": { \
        "annotations": { \
            "container.googleapis.com/instance_id": "4289334122173060952", \
            "node.alpha.kubernetes.io/ttl": "0", \
            "volumes.kubernetes.io/controller-managed-attach-detach": "true" \
        }, \
        "creationTimestamp": "2019-11-01T08:18:06Z", \
        "labels": { \
            "beta.kubernetes.io/arch": "amd64", \
            "beta.kubernetes.io/fluentd-ds-ready": "true", \
            "beta.kubernetes.io/instance-type": "n1-standard-1", \
            "beta.kubernetes.io/os": "linux", \
            "cloud.google.com/gke-nodepool": "default-pool", \
            "cloud.google.com/gke-os-distribution": "ubuntu", \
            "failure-domain.beta.kubernetes.io/region": "us-central1", \
            "failure-domain.beta.kubernetes.io/zone": "us-central1-c", \
            "kubernetes.io/hostname": "gke-gke-px-default-pool-0fa51c7f-gf4g", \
            "px/metadata-node": "true" \
        }, \
... \


```sh
kubectl get node/gke-gke-px-default-pool-0fa51c7f-gf4g \
-o jsonpath='{.metadata.labels.failure-domain\.beta\.kubernetes\.io/zone}'

```

or

```sh
kubectl get nx-default-pool-0fa51c7f-gf4g \
-o 'go-template={{index .metadata.labels "failure-domain.beta.kubernetes.io/zone"}}'
```

output: us-central1-c
