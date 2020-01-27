# Kubernetes concepts

https://docs.oracle.com/en/operating-systems/oracle-linux/kubernetes/index.html

## Kubernetes

__Kubernetes__ is an open-source system for automating the deployment, scaling and management of containerized applications across multiple hosts.

## Master Node

Master node a dedicated node for the control plane

The __master node__ is responsible for cluster management and for providing the API that is used to configure and manage resources within the Kubernetes cluster. Kubernetes master node components can be run within Kubernetes itself, as a set of containers within a dedicated pod.

The following components are required for a master node:

__API Server (kube-apiserver)__: the Kubernetes REST API is exposed by the API Server. This component processes and validates operations and then updates information in the Cluster State Store to trigger operations on the worker nodes. The API is also the gateway to the cluster.

__Cluster State Store (etcd)__: configuration data relating to the cluster state is stored in the Cluster State Store, which can roll out changes to the coordinating components like the Controller Manager and the Scheduler. It is essential to have a backup plan in place for the data stored in this component of your cluster.

__Cluster Controller Manager__ (kube-controller-manager): this manager is used to perform many of the cluster-level functions, as well as application management, based on input from the Cluster State Store and the API Server.

__Scheduler (kube-scheduler)__: the Scheduler handles automatically determining where containers should be run by monitoring availability of resources, quality of service and affinity and anti-affinity specifications.

__The master node__ is also usually configured as a worker node within the cluster. Therefore, the master node also runs the standard node services: the kubelet service, the container runtime (the Docker engine, in this case) and the kube proxy service. Note that it is possible to taint a node to prevent workloads from running on an inappropriate node. The kubeadm utility automatically taints the master node so that no other workloads or containers can run on this node. This helps to ensure that the master node is never placed under any unnecessary load and that backup and restore of the master node for the cluster is simplified.

If the master node becomes unavailable for a period, cluster functionality is suspended, but the worker nodes continue to run container applications without interruption.

For single node clusters, when the master node is offline, the API is unavailable, so the environment is unable to respond to node failures and there is no way to perform new operations like creating new resources or editing or moving existing resources.

A high availability cluster with multiple master nodes ensures that more requests for master node functionality can be handled, and with the assistance of master replica nodes, uptime is significantly improved.

## Master Replica Nodes

Master replica nodes are responsible for duplicating the functionality and data contained on master nodes within a Kubernetes cluster configured for high availability. To benefit from increased uptime and resilience, you can host master replica nodes in different zones, and configure them to load balance for your Kubernetes cluster.

Replica nodes are designed to mirror the master node configuration and the current cluster state in real time so that if the master nodes become unavailable the Kubernetes cluster can fail over to the replica nodes automatically whenever they are needed. In the event that a master node fails, the API continues to be available, the cluster can respond automatically to other node failures and you can still perform regular operations for creating and editing existing resources within the cluster.

You can use the __kubeadm-ha-setup__ utility to create a multi-master cluster where all master nodes are replicas of each other.

## Worker Nodes

__Worker nodes__  within the Kubernetes cluster are used to run containerized applications and handle networking to ensure that traffic between applications across the cluster and from outside of the cluster can be properly facilitated. The worker nodes perform any actions triggered via the Kubernetes API, which runs on the master node.

All nodes within a Kubernetes cluster must run the following services:

The Kubelet Service: the agent that allows each worker node to communicate with the API Server running on the master node. This agent is also responsible for setting up pod requirements, such as mounting volumes, starting containers and reporting status.

A Container Runtime: an environment where containers can be run. In this release, only Docker is supported. Therefore, the runtime here is equivalent to the Docker Engine.

The Kube Proxy Service: a service that programs iptables rules to handle port forwarding and IP redirects to ensure that network traffic from outside the pod network can be transparently proxied to the pods in a service.

In all cases, these services are run from __systemd__ as inter-dependent daemons.


## POD

Kubernetes introduces the concept of "pods", which are groupings of one or more containers and their shared storage and any specific options on how these should be run together. Pods are used for tightly coupled applications that would typically run on the same logical host and which may require access to the same system resources. Typically, containers in a pod share the same network and memory space and can access shared volumes for storage. These shared resources allow the containers in a pod to communicate internally in a seamless way as if they were installed on a single logical host.

You can easily create or destroy pods as a set of containers. This makes it possible to do rolling updates to an application by controlling the scaling of the deployment. It also allows you to scale up or down easily by creating or removing replica pods.

See https://kubernetes.io/docs/concepts/workloads/pods/pod/ for more information.

A Pod is the basic building block of Kubernetes - the smallest and somplest unit in the Kubernetes object model that you create or deploy. A Pod represents a running process on your cluster.

A Pod encapsulates an application container ( or , in some cases, multiple container ), storage resources, a unique network IP, and options that govern how the container(s) should run. A Pod represents a unit of deployment: a single instance of an application in Kubernetes, which might consist of either a single container or a small number of containers that are tightly coupled and that share resources.

## ReplicaSet, Deployment, StatefulSet Controllers

Kubernetes provides a variety of controllers that you can use to define how pods are set up and deployed within the Kubernetes cluster. These controllers can be used to group pods together according to their runtime needs and define pod replication and pod start up ordering.

You can define a set of pods that should be replicated with a __ReplicaSet__. This allows you to define the exact configuration for each of the pods in the group and which resources they should have access to. Using ReplicaSets not only caters to the easy scaling and rescheduling of an application, but also allows you to perform rolling or multi-track updates to an application.

See https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/ for more information on ReplicaSets.

You can use a __Deployment__ to manage pods and ReplicaSets. Deployments are useful when you need to roll out changes to ReplicaSets. By using a Deployment to manage a ReplicaSet, you can easily rollback to an earlier Deployment revision. A Deployment allows you to create a newer revision of a ReplicaSet and then migrate existing pods from a previous ReplicaSet into the new revision. The Deployment can then manage the cleanup of older unused ReplicaSets.

See https://kubernetes.io/docs/concepts/workloads/controllers/deployment/ for more information on Deployments.

You can use __StatefulSets__ to create pods that guarantee start up order and unique identifiers, which are then used to ensure that the pod maintains its identity across the lifecycle of the StatefulSet. This feature makes it possible to run stateful applications within Kubernetes, as typical persistent components such as storage and networking are guaranteed. Furthermore, when you create pods they are always created in the same order and allocated identifiers that are applied to host names and the internal cluster DNS. Those identifiers ensure there are stable and predictable network identities for pods in the environment.

See https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/ for more information on StatefulSets.


## Services

You can use services to expose access to one or more mutually interchangeable pods. Since pods can be replicated for rolling updates and for scalability, clients accessing an application must be directed to a pod running the correct application. Pods may also need access to applications outside of Kubernetes. In either case, you can define a service to make access to these facilities transparent, even if the actual backend changes.

Typically, services consist of port and IP mappings that are managed using iptables. How services function in network space is defined by the service type when it is created.

The default service type is the ClusterIP, and you can use this to expose the service on the internal IP of the cluster. This option makes the service only reachable from within the cluster. Therefore, you should use this option to expose services for applications that need to be able to access each other from within the cluster.

Frequently, clients outside of the Kubernetes cluster may need access to services within the cluster. You can achieve this by creating a NodePort service type. This service type enables you to take advantage of the Kube Proxy service that runs on every worker node and reroute traffic to a ClusterIP, which is created automatically along with the NodePort service. The service is exposed on each node IP at a static port, called the NodePort. The Kube Proxy routes traffic destined to the NodePort into the cluster to be serviced by a pod running inside the cluster. This means that if a NodePort service is running in the cluster, it can be accessed via any node in the cluster, regardless of where the pod is running.

Building on top of these service types, the LoadBalancer service type makes it possible for you to expose the service externally by using a cloud provider's load balancer. This allows an external load balancer to handle redirecting traffic to pods directly in the cluster via the Kube Proxy. A NodePort service and a ClusterIP service are automatically created when you set up the LoadBalancer service.

Important
As you add services for different pods, you must ensure that your network is properly configured to allow traffic to flow for each service declaration. If you create a NodePort or LoadBalancer service, any of the ports exposed must also be accessible through any firewalls that are in place.

If you are using Oracle Cloud Infrastructure, you must add ingress rules to the security lists for the Virtual Cloud Network (VCN) for your compute instances connections. Each rule should allow access to the port that you have exposed for a service.

Equally, if you are running firewalld on any of your nodes, you must ensure that you add rules to allow traffic for the external facing ports of the services that you create.

See https://kubernetes.io/docs/concepts/services-networking/service/ for more information.


## Volumes

In Kubernetes, a volume is storage that persists across the containers within a pod for the lifespan of the pod itself. When a container within the pod is restarted, the data in the Kubernetes volume is preserved. Furthermore, Kubernetes volumes can be shared across containers within the pod, providing a file store that different containers can access locally.

Kubernetes supports a variety of volume types that define how the data is stored and how persistent it is, which are described in detail at https://kubernetes.io/docs/concepts/storage/volumes/.

Kubernetes volumes typically have a lifetime that matches the lifetime of the pod, and data in a volume persists for as long as the pod using that volume exists. Containers can be restarted within the pod, but the data remains persistent. If the pod is destroyed, the data is usually destroyed with it.

In some cases, you may require even more persistence to ensure the lifecycle of the volume is decoupled from the lifecycle of the pod. Kubernetes introduces the concepts of the PersistentVolume and the PersistentVolumeClaim. PersistentVolumes are similar to Volumes except that they exist independently of a pod. They define how to access a storage resource type, such as NFS or iSCSI. You can configure a PersistentVolumeClaim to make use of the resources available in a PersistentVolume, and the PersistentVolumeClaim will specify the quota and access modes that should be applied to the resource for a consumer. A pod you have created can then make use of the PersistentVolumeClaim to gain access to these resources with the appropriate access modes and size restrictions applied.

For more information about PersistentVolumes, see https://kubernetes.io/docs/concepts/storage/persistent-volumes/. Examples of using PersistentVolumes are also provided in Section 5.2, “Pod Configuration Using a YAML Deployment” and Section 5.3, “Using Persistent Storage”.

## Namespaces

Kubernetes implements and maintains strong separation of resources through the use of namespaces. Namespaces effectively run as virtual clusters backed by the same physical cluster and are intended for use in environments where Kubernetes resources must be shared across use cases.

Kubernetes takes advantage of namespaces to separate cluster management and specific Kubernetes controls from any other user-specific configuration. Therefore, all of the pods and services specific to the Kubernetes system are found within the kube-system namespace. A default namespace is also created to run all other deployments for which no namespace has been set.

See https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/ for more information on namespaces.


