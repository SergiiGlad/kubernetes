## POD

A Pod is the basic building block of Kubernetes - the smallest and somplest unit in the Kubernetes object model that you create or deploy. A Pod represents a running process on your cluster.

A Pod encapsulates an application container ( or , in some cases, multiple container ), storage resources, a unique network IP, and options that govern how the container(s) should run. A Pod represents a unit of deployment: a single instance of an application in Kubernetes, which might consist of either a single container or a small number of containers that are tightly coupled and that share resources.

## Assigning Pods to Nodes

### Affinity

Affinity feature greatly expands the __nodeSelector__ 

__nodeAffinity__ is conceptually similar to __nodeSelector__ – it allows you to 
constrain which nodes your pod is eligible to be scheduled on, based on labels on the node.
The key enhancements are:

 * not just AND of exect match (Affinity,AntiAffinity,Operator: In, NotIn, Exists, DoesNotExist, Gt, Lt)
 * rule is “soft”/“preference” rather than a hard requirement
 * constrain against labels on other pods running on the node
 
 If you remove or change the label of the node where the pod is scheduled, the pod won’t be removed. In other words, the affinity selection works only at the time of scheduling the pod.
 
__Inter-pod affinity and anti-affinity__ allow you to constrain which nodes your pod is eligible 
to be scheduled _based on labels on pods that are already running on the node_ rather than based on labels on nodes.

## Not in master

spec:
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: px/enabled
                operator: NotIn
                values:
                - "false"
              - key: node-role.kubernetes.io/master
                operator: DoesNotExist




