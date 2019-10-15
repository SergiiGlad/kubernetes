
https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#nodeselector

## nodeSelector

Pod will get scheduled on the node that you attached the label to. 
Attache label to the node

```kubectl label nodes kubernetes-foo-node-1.c.a-robinson.internal disktype=ssd```

When you then run ```kubectl apply -f```

```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    env: test
spec:
  containers:
  - name: nginx
    image: nginx
    imagePullPolicy: IfNotPresent
  nodeSelector:
    disktype: ssd
```

Built-in node label:
 * kubernetes.io/hostname
 * failure-domain.beta.kubernetes.io/zone
 * failure-domain.beta.kubernetes.io/region
 * beta.kubernetes.io/instance-type
 * kubernetes.io/os
 * kubernetes.io/arch

__nodeSelector__ provides a very simple way to constrain pods to nodes with particular labels. 
The affinity/anti-affinity feature, greatly expands the types of constraints you can express. 

The __NodeRestriction__ admission plugin prevents _kubelets_ from setting or modifying _labels_ with a _node-restriction.kubernetes.io/_ prefix. 


``` kubectl describe googleCloudGKENode```

Name:               gke-standard-cluster-1-default-pool-bc7f9f43-mpb3
Roles:              <none>
Labels:             beta.kubernetes.io/arch=amd64
                    beta.kubernetes.io/fluentd-ds-ready=true
                    beta.kubernetes.io/instance-type=n1-standard-1
                    beta.kubernetes.io/os=linux
                    cloud.google.com/gke-nodepool=default-pool
                    cloud.google.com/gke-os-distribution=cos
                    failure-domain.beta.kubernetes.io/region=us-central1
                    failure-domain.beta.kubernetes.io/zone=us-central1-c
                    kubernetes.io/hostname=gke-standard-cluster-1-default-pool-bc7f9f43-mpb3
Annotations:        container.googleapis.com/instance_id: 1464553403113876181
                    node.alpha.kubernetes.io/ttl: 0
                    volumes.kubernetes.io/controller-managed-attach-detach: true

## Node affinity

Node affinity is conceptually similar to nodeSelector – it allows you to constrain which nodes your pod is eligible to be scheduled on, based on labels on the node.

```
spec:
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: kubernetes.io/hostname
                operator: In
                values:
                - gke-standard-cluster-1-default-pool-bc7f9f43-4169
```
## Inter-pod affinity and anti-affinity

Inter-pod affinity and anti-affinity allow you to constrain which nodes your pod is eligible to be scheduled _based on labels on pods that are already running on the node_ rather than based on labels on nodes. 

pods/pod-with-pod-affinity.yaml 

apiVersion: v1
kind: Pod
metadata:
  name: with-pod-affinity
spec:
  affinity:
    podAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
      - labelSelector:
          matchExpressions:
          - key: security
            operator: In
            values:
            - S1
        topologyKey: failure-domain.beta.kubernetes.io/zone
    podAntiAffinity:
      preferredDuringSchedulingIgnoredDuringExecution:
      - weight: 100
        podAffinityTerm:
          labelSelector:
            matchExpressions:
            - key: security
              operator: In
              values:
              - S2
          topologyKey: failure-domain.beta.kubernetes.io/zone
  containers:
  - name: with-pod-affinity
    image: k8s.gcr.io/pause:2.0



