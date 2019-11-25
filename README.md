
# Deploying and Scaling Microservices with Docker and Kubernetes

https://container.training/kube-selfpaced.yml.html#194

_"However difficult life may seem, there is always something you can do and succeed at. It matters that you don't just give up."_
												Stephen Hawking


## Kubernetes resources

 * The Kubernetes API defines a lot of objects call resources
 * We can see the full list by running ``` kubectl api-resources```
 * We can view the definition of a field in a resource ``` kubectl explain node.spec```
 * ```kubectl describe``` will retrieve some extra information about the resource
 * We can see the components that make up the Kubernetes cluster ```kubectl get componentstatuses```	
##

Declarative vs imperative

  * Declarative:
*I would like a cup of tea.*

  * Imperative:
*Boil some water. Pour it in a teapot. Add tea leaves. Steep for a while. Serve in a cup.*

## Show the capacity of all nodes

``` $ kubectl get no -o json | jq ".items[] | {name:.metadata.name} + .status.capacity"```

## Using ```kubectl proxy``` for authentication

```kubectl proxy &```
By default:
* proxy binds: 127.0.0.1
* proxy listens: 8001
* accept connection from: ^localhost$,^127\.0\.0\.1$,^\[::1\]$

Running kubectl proxy on a remote machine
### !!!Do not do this on a real cluster: it opens full unauthenticated access!!!
```
kubectl proxy --port=8888 --address=0.0.0.0 --accept-hosts=.*
```
### !!!Running kubectl proxy openly is a huge security risk!!!

```kubectl proxy``` also gives access to all internal services

We just add the URI to the end of the request, for instance:

```curl localhost:8001/api/v1/namespaces/default/services/webui/proxy/index.html```

if we want to access a TCP service we can use kubectl port-forward instead
```
kubectl port-forward svc/redis 10000:6379 &
```
	
## Services

 * A *service* is a stable endpoint to connect to "something"
 
Viewing andpoint details

 ``` 
 kubectl get endpoints
 ```

#### Headless Services

The Kubernetes API create a set of DNS records type "A"
```
kubectl expose deploy httpenv --port 8888 --cluster-ip=None
```
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

## Mastering the KUBECONFIG file

#### Know the kubeconfig precedence

 * flag ```kubectl --kubeconfig .kube/config get po```
 * env ```KUBECONFIG=./kube/config kubectl get po```
 * use path ``` $HOME/.kube/config

#### Using multiple kubeconfigs at once

```
export KUBECONFIG=file1:file2
kubectl get pods --context=cluster-1
kubectl get pods --context=cluster-2
```

#### Merging kubeconfig files
```
KUBECONFIG=file1:file2:file3 kubectl config view \
    --merge --flatten > out.txt
```
#### Extracting a context from a kubeconfig file
```
KUBECONFIG=in.txt kubectl config view \
    --minify --flatten --context=context-1 > out.txt
```
To update the server address, run:
```
kubectl config set-cluster kubernetes --server=https://X.X.X.X:6443
# Make sure to replace X.X.X.X with the IP address of node1!
```

#### Use kubectl without a kubeconfig

```
KUBECONFIG= kubectl get nodes \
 --server https://localhost:6443 \
 --user docker-for-desktop \
 --client-certificate my.cert \
 --client-key my.key \
 --insecure-skip-tls-verify
```

#### Know which context you’re pointing at

```
$ kubeon
{⎈ |N/A:N/A} $ export KUBECONFIG=f2
{⎈ |docker-for-desktop:default} $ export KUBECONFIG=f1
{⎈ |gke_ahmetb_us-central1-b_mycluster:kube-system} $ kubens default
Active namespace is "default".
{⎈ |gke_ahmetb_us-central1-b_mycluster:kube-system} $ kubeoff
$
```
[Mastering the KUBECONFIG docs](https://medium.com/@ahmetb/mastering-kubeconfig-4e447aa32c75)

#### Generating the kubeconfig

Generate the kubeconfig file (replacing X.X.X.X with the address of kuberouter1):
```
kubectl config set-cluster cni --server http://X.X.X.X:8080
kubectl config set-context cni --cluster cni
kubectl config use-context cni
cp ~/.kube/config ~/kubeconfig
```


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
```
kubectl scale deploy/pingpong --replicas 3
```
or
```
kubectl scale deployment pingpong --replicas 3
```


## Various ways of creating resoutces

Under the hood, ```kubectl run``` invokes "generator" to create resource descriptions 
 * ```kubectl run --restart=OnFailure```

 * ```kubectl create <resource>```
 * ```kubectl create -f foo.yaml``` or ```kubectl apply -f foo.yaml```
 
We can also create cronjobs
 * ```kubectl run --schedule=...``` 


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
or

	$ kubectl config set-credentials sa-user --token=$(kubectl get secret <secret_name> -o jsonpath={.data.token} | base64 -d)

[Configuring the Kubernetes CLI by using service account tokens ](https://www.ibm.com/developerworks/community/blogs/fe25b4ef-ea6a-4d86-a629-6f87ccf4649e/entry/Configuring_the_Kubernetes_CLI_by_using_service_account_tokens1?lang=en)

 * m5.4xlarge — monitoring Prometheus;
 * c5.4xlarge — Node.js (однопоточная рабочая нагрузка);
 * c5.2xlarge — Java и Go (многопоточная рабочая нагрузка);
 * c5.4xlarge — для контрольной панели (3 узла).

