## Pods in Kubernetes

#### Pod is mortal

However, applications in different Pods	are isolated from each other;they have different IP addresses, different hostnames, and	more. Containers in ifferent Pods running on the same node might as well be on different servers.

**Multiple Pods can be placed on the same machine	as long	as there are sufficient	resources.**	

Multiple instances of a	Pod can	be deployed by repeating the workflow described	here. However,	ReplicaSet are better suited for running multiple instances of a Pod.

``` $ kubectl apply -f kuard-pod.yaml```

The Pod	manifest will be submitted to the Kubernetes API server.The Kubernetes system will then	schedule that Pod to run on a **healthy node** in the cluster, where it	will be	monitored by the  kubelet daemon process.

#### Using Port Forwarding

``` $ kubectl port-forward po kuard 8080:8080 ```

If your cluster in the cloud sameplace, you can use SSh tunneling with something like this:

	ssh <kube node> -L 8081:localhost:8080 
	
	curl localhost:8081


#### Getting more info with Logs

``` $ kubectl logs kuard ```

Adding the  --previous 	flag will get logs from	a previous instance of the container. This is useful, for example, if your containers are continuously restarting due to a problem at container startup.

## Liveness and Readiness Probe

**_Liveness_** probes are defined per container, which means each container inside a Pod is health-checked separately.

Kubernetes makes a distinction between **_liveness_** and **_readiness_**.

Containers that	fail liveness checks are restarted.Readiness describes when a container	is ready to serve user requests.Containers that	fail readinesschecks are removed from service load balancers.	
	
## Resource	Management

**Resource Requests**:	Minimum	Required	Resources

Resources are requested per container, not per Pod. The total resources requested by the Pod is the sum of all resources requested by all containers in the Pod.The reason for this is that in many cases the different containers have very different CPU requirements.	

**The Kubernetes scheduler will ensure	that the sum of all requests of all Pods on a node does not exceed the capacity of the node.**

## Persisting	Data	with	Volumes


## LABELS

###### $ kubectl get po --show-labels

###### $ kubectl get po -l run=kuard
	or
###### $ kubectl get po --selector="run=kuard,ver=2"

###### $ kubectlget pods --selector="app in (alpaca,bandicoot)"

###### $ kubectl get deployments --selector="canary" { all deployment with canary label }

## Endpoint

###### $ kubectl describe endpoints alpaca-prod

###### $ kubectl get endpoints alpaca-prod --watch

## Replica Set

###### $ kubectl get pods -l app=kuard,version=2 { finding a set of Pods for replica set}

###### $ kubectl scale kuard --replicas=4 { scale up to four replicas }
 
###### $ kubectl autoscale rs kuard --min=2 --max=5 --cpu-percent=80 { scale base on CPU }

###### $ kubectl get hpa { horizonttal pod autoscaling }

###### $ kubectl delete	rs kuard --cascade=false  { delete th Podsthat are being managed by the ReplicaSet, not the Pod }

	
