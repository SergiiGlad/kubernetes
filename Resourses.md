
## KUBERNETES TERMS

 * **_Cluster_**: A collection of nodes that are being managed by Kubernetes

 * **_Node_**: A VM or physical machine that contains one or more containers

 * **_Master Node_**: The node that coordinates everything in the cluster

## KUBERNETES OBJECTS

 * **_DaemonSet_**: It automatically deploys Pods onto new hosts are deployed into the cluster.

 * **_Pod_**: A running process on the cluster. Can be an application container (sometimes multiple containers)

 * **_Service_**: Defines policies for accessing Pods

 * **_Deployment_**: Describes the desired state for how pods should be deployed across a cluster


## KUBERNETES Network

 * **_Cluster IP_**: It is allocated an internal IP that other components can use to access the pods.

 * **_Target port_**: Target ports allows us to separate the port the service is available on from the port the application is listening on.

 * **_NodePort_**: NodePort exposes the service on each Node's IP via the defined static port.

 * **_External IPs_** Another approach to making a service available outside of the cluster is via External IP addresses.


