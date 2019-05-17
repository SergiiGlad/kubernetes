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

## Setting up Kubernetes && ```kubeadm``` drawbacks

 * Doesn't set up Docker or any other conrainer engine
 * Doesn't set up the overlay network
 * Doesn't set up multi-master ( no high avaliability )

This tutorial walks you through setting up Kubernetes the hard way.
[Kubernetes The Hard Way](https://github.com/kelseyhightower/kubernetes-the-hard-way )

## Running our first containers on Kubernetes

```
kubectl run pingpong --image alpine ping 1.1.1.1
```
List most resource type:
	kubectl get all

 * A *deployment* is a high-level construct
   * allows scaling, rolling updates, rollbacks
   * multiple deployments can be used together to implement a canary deployment
   * delegates pods management to replica sets

 * A *replica set* is a low-level construct
   * makes sure that a given number of identical pods are running
   * allows scaling
   * rarely used directly
  
## Scaling our application

	kubectl scale deploy/pingpong --replicas 3
or
	kubectl scale deployment pingpong --replicas 3


## Various ways of creating resoutces

 * ```kubectl run```
 * ```kubectl create <resource>
 * ```kubectl create -f foo.yaml``` or ```kubectl apply -f foo.yaml```

## Streaming logs of many pods

Stream the logs:
	kubectl logs -l run=pingpong --tail 1 -f

#### maximum allowed concurency is 5

## Exposing containers

```kubectl expose``` creates a *service* for existing pods

There are different types of services
```ClusterIP```,```NodePort```,```LoadBalancer```,```ExternalName```

	kubectl get svc $SERVICE -o go-template={{ .spec.clusterIP }}

## Daemon Sets

Dump the resource in YAML:
	kubectl get deploy/name -o yaml --export > name.yaml

Try to load our YAML file and ignore errors:
	kubectl apply -f name.yaml --validate=false


## Rolling  updates
Show the rollout plan for our deployments:

	kubectl get deploy -o json | jq ".items[] | {name:.metadata.name} + .spec.strategy.rollingUpdate"

## Context

Check the result
	kubectl config get-contexts

Update the current context
	kubectl config set-context --current --namespace=kube-system

Switch back to the original context
	kubectl config set-context --current --namespace=

##### Switching namespaces more easily to use a little helper tool called `kubens` or `kubectx`

https://github.com/ahmetb/kubectx

`kube-ps1` makes it easy to track and highlighte part

https://github.com/jonmosco/kube-ps1

## Finding the secret

	kubectl get sa default -o yaml
	SECRET=$(kubectl get sa default -o json | jq -r .secrets[0].name)

Extracting the token
	kubectl get secret $SECRET -o yaml
	TOKEN=$( kubectl get secret $SECRET -o json | jq -r .data.token | openssl base64 -d -A)


