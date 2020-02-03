# KUBERNETES CONCEPTS

Kubernetes resources can be created directly on the command line but are usually specified using **Yet Another Markup Language (YAML)**

---

## KUBERNETES TERMS

 * **_Cluster_**: A collection of nodes that are being managed by Kubernetes

 * **_Node_**: A VM or physical machine that contains one or more containers

 * **_Master Node_**: The node that coordinates everything in the cluster

 * **_Worker Node_**: runs tasks as delegated by the master
 
 * **_etcd_**: distributed key-value store used to persist Kubernetes system state
 
 * **_The Kuberneres API_**: The Kubernetes API server is a "dumb server" which offers storage, versioning, validation, update, and watch semantics on API resources.

(Clayton Coleman, Kubernetes Architect and Maintainer)
 
 * **_kube-controller-manager_**: a monitoring program that decides what changes to make when resources are added, changed, or removed
 
 * **_kube-scheduler_**: a program that decides where to run pods based on the available nodes and their configuration
 
 * **_kube-proxy_**: manages networking rules so connections to service IP addresses are correctly routed to pods

 * **_kube-dns_**: provide naming and discovery for the services that are defined in the cluster

## KUBERNETES OBJECTS

### Workload

 * **_DaemonSet_**: It automatically deploys Pods onto new hosts are deployed into the cluster. To schedule a single Pod on every node within the cluster, except on the master node. It's good examples as fluentd or calico network.
 
 * **_Pod_**: A running process on the cluster. Can be an application container (sometimes multiple containers)

 * **_Service_**: Defines a logical set of pod and policies for accessing Pods. It provides two main functionalities service-discovery and load-balancing.

 * **_Deployment_**: Describes the desired state for how pods should be deployed across a cluster. Using Deployment you can simply and reliably rollout new software version without downtime or error. This "rollout: process is configurable and careful.
 Deployment responsible for updating pods in a rolling update fashion and is implemented internally in controllers.
 
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

 * **_Cluster IP_**: It is allocated an internal reachable IP that other components can use to access the pods

 * **_Target port_**: Target ports allows us to separate the port the service is available on from the port the application is listening on
 
 * **_hostPort_**: only really used for testing perposes or very earely to stick a pod to a specific node and publish under a specific ip address pointing to this node

 * **_NodePort_**: NodePort exposes the service on each Node's IP via the defined static port

 * **_External IPs_** Another approach to making a service available outside of the cluster is via External IP addresses

[Deploy calico network policy Katakoda ](https://www.katacoda.com/courses/kubernetes/deploy-calico-networking "Network Policy")

[IBM Kubernetes Networking] (https://github.com/IBM/kubernetes-networking)

## NodePort and LoadBalancer Services

The types of IPs presented so far, pod IPs and ClusterIPs, are usable only from within the Kubernetes cluster. It is not possible for applications outside the cluster to use them to reach a pod (without additional configuration, e.g. adding your own routes). For that we need to use a type of service which provides an external IP address. Kubernetes provides two service types which do this.

   * A ```NodePort``` service exposes the service at a static port (the NodePort) on each node. A ClusterIP service, to which the NodePort service will route, is automatically created.

   * A ```LoadBalancer``` service exposes the service externally using a cloud provider's load balancer. NodePort and ClusterIP services, to which the external load balancer will route, are automatically created.
   
 ## Ingress

A Kubernetes LoadBalancer service is a TCP layer (layer 4) load balancer. If you want the features of an application layer (layer 7) load balancer, you need to use an Ingress resource instead of a LoadBalancer service. Let's change the guestbook application for using a LoadBalancer service to using an Ingress resource. First let's delete the existing guestbook service.


## STORAGE

 * **_PERSISTENT VOLUME CLAIM_**: requests Kubernetes to dynamically allocate storage from a Storage Class. You can declare volumes directly inside a Pod specification, but this locks that Pod specification to a particular volume provider (e.g., a specific public or private cloud).


## Kind
	
 * **_ResourceQuota_**: specifying a quota allows you to restrict how much of a cluster's resources can be consumed across all pods in a namespace ( cpu, memory, pods, services etc ).

 * **_namespace_**: uses to avoid name collisions, to control access and to set quotas
 
 * **_Readiness Probes_**: checks if an application is ready to start processing traffic
 
 * **_Labels_** are key/value pairs that can be attached to Kubernetes objects such as a Pods adn ReplicaSets

 * **_Annotation_** that resebles label are key/value pairs that can be leveragedby tools and libraries
 
 * **_Endpoints_** Some app want to be able to use services without using a cluster IP

 * **_Autoscaling_** a ReplicaSet
 “Horizontal	pod	autoscaling”	is	kind	of	a	mouthful,	and	you	might	wonder	why
it	is	not	simply	called	“autoscaling.”	Kubernetes	makes	a	distinction	between
horizontal	scaling,	which	involves	creating	additional	replicas	of	a	Pod,	and
vertical	scaling,	which	involves	increasing	the	resources	required	for	a	particular
Pod	(e.g.,	increasing	the	CPU	required	for	the	Pod).	Vertical	scaling	is	not
currently	implemented	in	Kubernetes,	but	it	is	planned.

* **_replicas_** describes how many pods this deployment should have. In our case, there will be one only one pod created

* **_template_** describes how each pod should look like. It describes a list of containers that should be in the Pod

* **_selector_** determines which pods are considered to be part of this deployment. This uses labels to 'select' pods

* **_strategy_** states how an update to a deployment should be rolled out



	Book 
[Site Reliability Engineer](http://shop.oreilly.com/product/0636920041528.do)
 
