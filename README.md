## Kubernetes resources

 * The Kubernetes API defines a lot of objects call resources
 * We can see the full list by running ``` kubectl api-resources```
 * We can view the definition of a field in a resource ``` kubectl explain node.spec```
 * ```kubectl describe``` will retrieve some extra information about the resource
##

Declarative vs imperative

  * Declarative:
*I would like a cup of tea.*

  * Imperative:
*Boil some water. Pour it in a teapot. Add tea leaves. Steep for a while. Serve in a cup.*

## Show the capacity of all nodes

``` $ kubectl get no -o json | jq ".items[] | {name:.metadata.name} + .status.capacity"```

## Services

 * A *service* is a stable endpoint to connect to "something"

##### There is already one service on our cluster: the Kubernetes API itself.

## Kube-public and kubeconfig
##### List the pods in the kube-public namespaces:
	$ kubectl -n kube-public get pods
##### List ConfigMap objects:
	$ kubectl -n kube-public get configmaps
##### Inspect cluster-info
	$ kubectl -n kube-public get configmap cluster-ingo -o yaml
#####  Retrive cluster-info
	$ curl -k https://10.96.0.1/api/v1/namespaces/kube-public/configmaps/cluster-info
##### Display the content of ```kubeconfig```
	$ curl -sk https://10.96.0.1/api/v1/namespaces/kube-public/configmaps/cluster-info | jq -r .data.kubeconfig







