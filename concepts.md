## Assigning Pods to Nodes

### Affinity

Affinity feature greatly expands the __nodeSelector__ 

__nodeAffinity__ is conceptually similar to __nodeSelector__ – it allows you to 
constrain which nodes your pod is eligible to be scheduled on, based on labels on the node.

Inter-pod affinity and anti-affinity allow you to constrain which nodes your pod is eligible 
to be scheduled _based on labels on pods that are already running on the node_ rather than based on labels on nodes.
