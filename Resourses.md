
## KUBERNETES TERMS

 * **_Cluster_**: A collection of nodes that are being managed by Kubernetes

 * **_Node_**: A VM or physical machine that contains one or more containers

 * **_Master Node_**: The node that coordinates everything in the cluster

 * **_Worker Node_**: runs tasks as delegated by the master
 
 * **_etcd_**: distributed key-value store used to persist Kubernetes system state

## KUBERNETES OBJECTS

 * **_DaemonSet_**: It automatically deploys Pods onto new hosts are deployed into the cluster

 * **_Pod_**: A running process on the cluster. Can be an application container (sometimes multiple containers)

 * **_Service_**: Defines a logical set of pod and policies for accessing Pods. Also act as LoadBalance

 * **_Deployment_**: Describes the desired state for how pods should be deployed across a cluster
 
* **_REPLICATION CONTROLLER_**: Ensure that a specified number of pod replicas a re running on worker nodes at all times.


## KUBERNETES Network

 * **_Cluster IP_**: It is allocated an internal IP that other components can use to access the pods

 * **_Target port_**: Target ports allows us to separate the port the service is available on from the port the application is listening on

 * **_NodePort_**: NodePort exposes the service on each Node's IP via the defined static port

 * **_External IPs_** Another approach to making a service available outside of the cluster is via External IP addresses

** Kind
	
 * **_ResourceQuota_**: specifying a quota allows you to restrict how much of a cluster's resources can be consumed across all pods in a namespace ( cpu, memory, pods, services etc ).

