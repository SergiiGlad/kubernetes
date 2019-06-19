## Kubernetes Resiurce Model

https://github.com/IBM/kube101/tree/master/workshop

#### Kubernetes does not have the concept of an application. It has simple building blocks that you are required to compose. Kubernetes is a cloud native platform where the internal resource model is the same as the end user resource model.

Kubernetes Infrastructure defines a resource for every purpose. Each resource is monitored and processed by a controller. When you define your application, it contains a collection of these resources. This collection will then be read by Controllers to build your applications actual backing instances. Some of resources that you may work with are listed below for your reference, for a full list you must go to https://kubernetes.io/docs/concepts/. In this class we will only use a few of them, like Pod, Deployment, etc.

Name | Desc
--- | ---
Config Maps | holds configuration data for pods to consume.
Daemon Sets | ensure that each node in the cluster runs this Pod
Deployments | defines a desired state of a deployment object
Events | provides lifecycle events on Pods and other deployment objects
Endpoints | allows a inbound connections to reach the cluster services
Ingress | is a collection of rules that allow inbound connections to reach the cluster services
Jobs | creates one or more pods and as they complete succefully the job is marked as completed.
Node | is a worker machine in Kubernetes
Namespaces | are multiple virtual clusters backed by the same physical cluster
Pods | are the smallest deployable units of computing that can be created and managed in Kubernetes
Persistent Volumes | provides an API for users and administrators that abstracts details of how storage is provided from how it is consumed
Replica Sets | ensures that a specified number of pod replicas are running at any given time
Secrets | are intended to hold sensitive information, such as passwords, OAuth tokens, and ssh keys
Service Accounts | provides an identity for processes that run in a Pod
Services  | is an abstraction which defines a logical set of Pods and a policy by which to access them - sometimes called a micro-service.
Stateful Sets | is the workload API object used to manage stateful applications.   
and more...

