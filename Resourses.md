# KUBERNETES CONCEPTS

Kubernetes resources can be created directly on the command line but are usually specified using **Yet Another Markup Language (YAML)**

---

## KUBERNETES TERMS

 * **_Cluster_**: A collection of nodes that are being managed by Kubernetes

 * **_Node_**: A VM or physical machine that contains one or more containers

 * **_Master Node_**: The node that coordinates everything in the cluster

 * **_Worker Node_**: runs tasks as delegated by the master
 
 * **_etcd_**: distributed key-value store used to persist Kubernetes system state
 
 * **_kube-controller-manager_**: a monitoring program that decides what changes to make when resources are added, changed, or removed
 
 * **_kube-scheduler_**: a program that decides where to run pods based on the available nodes and their configuration
 
 * **_kube-proxy_**: manages networking rules so connections to service IP addresses are correctly routed to pods

## KUBERNETES OBJECTS

### Workload

 * **_DaemonSet_**: It automatically deploys Pods onto new hosts are deployed into the cluster

 * **_Pod_**: A running process on the cluster. Can be an application container (sometimes multiple containers)

 * **_Service_**: Defines a logical set of pod and policies for accessing Pods. Also act as LoadBalance

 * **_Deployment_**: Describes the desired state for how pods should be deployed across a cluster
 
 * **_REPLICATION CONTROLLER_**: Ensure that a specified number of pod replicas a re running on worker nodes at all times.

 * **_StatefulSets_**: Keeps unique IDs in replicas

### Config and Storage

 * **_Secrets_**: store pieces of data in k8s e.g. Identity Information (securely)

 * **_Config Maps_**: same as Secret ( unprotected )


## KUBERNETES Network

 * **_Cluster IP_**: It is allocated an internal IP that other components can use to access the pods

 * **_Target port_**: Target ports allows us to separate the port the service is available on from the port the application is listening on

 * **_NodePort_**: NodePort exposes the service on each Node's IP via the defined static port

 * **_External IPs_** Another approach to making a service available outside of the cluster is via External IP addresses

## STORAGE

 * **_PERSISTENT VOLUME CLAIM_**: requests Kubernetes to dynamically allocate storage from a Storage Class.


## Kind
	
 * **_ResourceQuota_**: specifying a quota allows you to restrict how much of a cluster's resources can be consumed across all pods in a namespace ( cpu, memory, pods, services etc ).

 * **_namespace_**: uses to avoid name collisions, to control access and to set quotas 
