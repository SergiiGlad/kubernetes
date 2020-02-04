# Kubernetes deployment strategies

https://github.com/ContainerSolutions/k8s-deployment-strategies#kubernetes-deployment-strategies


* **recreate:** terminate the old version and release the new one </li>
* __ramped:__ release a new version on a rolling update fashion, one after the other </li>
* __blue/green:__ release a new version alongside the old version then switch traffic </li>
* __canary:__ release a new version to a subset of users, then proceed to a full rollout </li>
* __a/b testing:__ release a new version to a subset of users in a precise way (HTTP headers, cookie, weight, etc.). This doesn’t come out of the box with Kubernetes, it imply extra work to setup a smarter loadbalancing system (Istio, Linkerd, Traeffik, custom nginx/haproxy, etc) </li>
* __shadow:__ release a new version alongside the old version. Incoming traffic is mirrored to the new version and doesn't impact the response </li>

![Deployment strategies](decision-diagram.png)
