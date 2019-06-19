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

 * **_kube-dns_**: provide naming and discovery for the services that are defined in the cluster

## KUBERNETES OBJECTS

### Workload

 * **_DaemonSet_**: It automatically deploys Pods onto new hosts are deployed into the cluster. To schedule a single Pod on every node within the cluster.
 * **_Pod_**: A running process on the cluster. Can be an application container (sometimes multiple containers)

 * **_Service_**: Defines a logical set of pod and policies for accessing Pods. Also act as LoadBalance

 * **_Deployment_**: Describes the desired state for how pods should be deployed across a cluster. Using Deployment you can simply and reliably rollout new software version without downtime or error. This "rollout: process is configurable and careful.
 
 * **_REPLICATION CONTROLLER_**: Ensure that a specified number of pod replicas a re running on worker nodes at all times.

 * **_StatefulSets_**: Keeps unique IDs in replicas. StatefulSets are replicated groups of Pods similar to ReplicaSets, but unlike a ReplicaSet, they have certain unique properties:
	* Each replica gets a persistent hostname with a unique index (e.g.,database-0 ,	 database-1 ,	etc.).
 	* Each replica	is created in order from lowest to highest index, and creation will block until the Pod at the previous	index is healthy and available. This also applies to	scaling	up.
 	* When	deleted, each replica will be deleted in order from highest to lowest. This also applies to scaling down the number of replicas.
 
 * **_Replica set_**: easy to create and manage replicated sets of Pods (Redundancy, Scale, Sharding), pattern for Pods

 * **_Jobs_**: A Job creates Pods that run until successful termination	(i.e.,	exit	with	0).

### Config and Storage

 * **_Secrets_**: store pieces of data in k8s e.g. Identity Information (securely)

 * **_Config Maps_**: same as Secret ( unprotected ). ConfigMap are used to provide configuration information for workloads


## KUBERNETES Network

 * **_Cluster IP_**: It is allocated an internal IP that other components can use to access the pods

 * **_Target port_**: Target ports allows us to separate the port the service is available on from the port the application is listening on

 * **_NodePort_**: NodePort exposes the service on each Node's IP via the defined static port

 * **_External IPs_** Another approach to making a service available outside of the cluster is via External IP addresses

[Lab 3 ](https://www.katacoda.com/courses/kubernetes/deploy-calico-networking "Network Policy")

## STORAGE

 * **_PERSISTENT VOLUME CLAIM_**: requests Kubernetes to dynamically allocate storage from a Storage Class. You can declare volumes directly inside a Pod specification, but this locks that Pod specification to a particular volume provider (e.g., a specific public or private cloud).


## Kind
	
 * **_ResourceQuota_**: specifying a quota allows you to restrict how much of a cluster's resources can be consumed across all pods in a namespace ( cpu, memory, pods, services etc ).

 * **_namespace_**: uses to avoid name collisions, to control access and to set quotas
 
 * **_Readiness Probes_**: checks if an application is ready to start processing traffic
 
 * **_Labels_** are key/value pairs that can be attached to Kubernetes objects such as a Pods adn ReplicaSets

 * **_Annotation_** that resebles label are key/value pairs that can be leveragedby tools and libraries
 
 * **_Endpoints_** Some app want to be able to use services without using a cluster IP

 * **_Autoscaling a ReplicaSet
 “Horizontal	pod	autoscaling”	is	kind	of	a	mouthful,	and	you	might	wonder	why
it	is	not	simply	called	“autoscaling.”	Kubernetes	makes	a	distinction	between
horizontal	scaling,	which	involves	creating	additional	replicas	of	a	Pod,	and
vertical	scaling,	which	involves	increasing	the	resources	required	for	a	particular
Pod	(e.g.,	increasing	the	CPU	required	for	the	Pod).	Vertical	scaling	is	not
currently	implemented	in	Kubernetes,	but	it	is	planned.	



	Book 
[Site Reliability Engineer](http://shop.oreilly.com/product/0636920041528.do)
 
