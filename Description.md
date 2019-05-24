## Pods in Kubernetes

#### Pod is mortal

However, applications in different Pods	are isolated from each other;they have different IP addresses, different hostnames, and	more. Containers in ifferent Pods running on the same node might as well be on different servers.

**Multiple Pods can be placed on the same machine	as long	as there are sufficient	resources.**	

Multiple instances of a	Pod can	be deployed by repeating the workflow described	here. However,	ReplicaSet are better suited for running multiple instances of a Pod.

``` $ kubectl apply -f kuard-pod.yaml```

The Pod	manifest will be submitted to the Kubernetes API server.The Kubernetes system will then	schedule that Pod to run on a **healthy node** in the cluster, where it	will be	monitored by the  kubelet daemon process.

#### Using Port Forwarding

``` $ kubectl port-forward po kuard 8080:8080 ```

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






	
