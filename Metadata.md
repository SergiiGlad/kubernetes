## To find our more details

###### $ kubectl describe pod $(kubectl get pods --selector="name=<name pod> -o jsonpath={.items..metadata.name})

## Deploy Persistent Volume

The *PersistentVolume* supports different protocols for storing data
 * AWS EBS volumes
 * GCE storage
 * OpenStack Conder
 * Gluster
 * NFS 

## FORGE

https://forge.sh

Define and deploy multi-container apps in Kubernetes, from source

## Helm

Helm is the best way to find, share and use software built for Kubernetes

http://www.helm.sh

###### $ helm init { the easiest way to install ```tiller``` into the cluster }
