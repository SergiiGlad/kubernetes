## Kubernetes master components

Master component description

### kube-apiserver

__cloud.ibm.com__
```
The Kubernetes API server serves as the main entry point 
for all cluster management requests from the worker node to 
the Kubernetes master. The Kubernetes API server validates 
and processes requests that change the state of Kubernetes 
resources, such as pods or services, and stores this state 
in etcd.
```
__kubernetes.io__
```
The Kubernetes API server validates and configures data for the api objects which include pods, services, replicationcontrollers, and others. The API Server services REST operations and provides the frontend to the cluster’s shared state through which all other components interact.
```




master component | Description
--- | ---
kube-apiserver | __cloud.ibm.com__  _The Kubernetes API server serves as the main entry point for all cluster management requests from the worker node to the Kubernetes master. The Kubernetes API server validates and processes requests that change the state of Kubernetes resources, such as pods or services, and stores this state in etcd._
kube-apiserver  | __kubernetes.io__ _The Kubernetes API server validates and configures data for the api objects which include pods, services, replicationcontrollers, and others. The API Server services REST operations and provides the frontend to the cluster’s shared state through which all other components interact._
--- |
etcd | _etcd is a highly available key value store that stores the state of all Kubernetes resources of a cluster, such as services, deployments, and pods. Data in etcd is backed up to an encrypted storage instance that IBM manages._
--- | 
kube-controller-manager | __cloud.ibm.com__ _The Kubernetes controller manager is a daemon that watches the state of cluster resources, such as replica sets. When the state of a resource changes, for example if a pod in a replica set goes down, the controller manager initiates correcting actions to achieve the required state._
kube-controller-manager | __kubernetes.io__ _The Kubernetes controller manager is a daemon that embeds the core control loops shipped with Kubernetes. In applications of robotics and automation, a control loop is a non-terminating loop that regulates the state of the system. In Kubernetes, a controller is a control loop that watches the shared state of the cluster through the apiserver and makes changes attempting to move the current state towards the desired state. Examples of controllers that ship with Kubernetes today are the replication controller, endpoints controller, namespace controller, and serviceaccounts controller._
