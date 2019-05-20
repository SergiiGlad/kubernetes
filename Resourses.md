
## KUBERNETES TERMS

 * *Cluster*: A collection of nodes that are being managed by Kubernetes
 * *Node*: A VM or physical machine that contains one or more containers
 * *Master*: Node: The node that coordinates everything in the cluster

## KUBERNETES OBJECTS

 * *DaemonSet*: It automatically deploys Pods onto new hosts are deployed into the cluster.
 * *Pod*: A running process on the cluster. Can be an application container (sometimes multiple containers)
 * *Service*: Defines policies for accessing Pods
 * *Deployment*: Describes the desired state for how pods should be deployed across a cluster



## KUBERNETES Network

 * *Cluster IP*: It is allocated an internal IP that other components can use to access the pods.

 * *Target port*: Target ports allows us to separate the port the service is available on from the port the application is listening on

 * *NodePort*: NodePort exposes the service on each Node's IP via the defined static port.

 * *External IPs* Another approach to making a service available outside of the cluster is via External IP addresses.


