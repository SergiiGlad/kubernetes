## To find our more details

###### $ kubectl describe pod $(kubectl get pods --selector="name=<name pod> -o jsonpath={.items..metadata.name})

list of containers in a pod

	$ kubectl get pods <pod name> -n <namespace> -o jsonpath='{.spec.containers[*].name}'

Namespace kube-system

**Controller** _The controller manager watches the state of the cluster via the API to ensure all requsted services are running. When new services are deployed, the controller will communicate with the API and nodes to complete the required tasks_

**Schedule** _The Scheduler Server handles tracking resource use. It ensures containers can ru on it's assigned node without overloading capacity_

**DNS** _DNS allows containers to communicate via well-known names instead of IP addresses_

**Proxy** _Each node in the cluster requires a running proxy server. The proxy is responsibility for managing communications by modifying the IPTables of the host machine. It also handles load balancing of traffic between containers on a host_


POD Name | Container(s)
--- | ---
pod/etcd-docker-for-desktop | etcd
pod/kube-apiserver-docker-for-desktop | kube-apiserver
pod/kube-controller-manager-docker-for-desktop | kube-controller-manager
pod/kube-dns-86f4d74b45-dvbkc | kubedns dnsmasq sidecar
pod/kube-proxy-krkh7 | 	kube-proxy
pod/kube-scheduler-docker-for-desktop | kube-scheduler
pod/kubernetes-dashboard-669f9bbd46-xm9pw | kubernetes-dashboard
pod/kubernetes-dashboard-head-5fdbcf4c7b-7gdhj | kubernetes-dashboard-head
pod/tiller-deploy-7878bfc556-mkjrt | tiller
pod/weave-net-clxcz | weave weave-npc


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
