## 1. Kubernetes ecosystem

On this topic, we will describe what the Kubernetes is. How it works and from which components consist is.

### Master components

 * API server (kube-apiserver)
 * etcd - reliable distributed key-value store
 * Scheduler (kube-scheduler)
 * Controllers
   * Kube controller ( kube-controller-manager)
     * Replication controller
     * Endpoints controller
     * Service account and token controllers
   * Cloud controller (cloud-controller-manager)
 * Add-ons
   * Kube DNS (kube-dns)
   * Web  UI (dashboard)
   * Container resource
   * Monitoring
   * Cluster-level logging


### Node components

 * Kubelet (kubelet)
 * Kube proxy (kube-proxy)
 * Container runtime
   * Docker (containerd)
 * Monitoring/Logging
   * Supervisord
   * Fluentd

### GKE architecture
 * Master Node (API Server, etcd scheduler, controller-managers)
 * Nodes running container-optimized OS or Ubuntu
 * Kube-dns deployment
 * Kube-dns autoscaler deployment
 * Event-exporter deployment logging to Stackdriver Logging
 * fluentd daemon set logging to Stackdriver Logging
 * Heapster deployment writing to Stackdriver Monitoring
 


## 2. Deploy Kubernetes on Google Cloud (GKE)

This is an initial step. We will deploy the Kubernetes cluster manually and will see how it works on GKE example.
Pods that are running inside Kubernetes are running on a private, isolated network. By default they are visible from other pods and services within the same kubernetes cluster, but not outside that network.

## 3. Blue-Green Deployment, Rolling Update, Canary Deployment

We will try the most popular methods for deployments in Kubernetes.

## 4. Storages, Stateful services.

Working with storages and stateful sets is the most frequent case in working with Kubernetes. We will describe these topics.

## 5. Update StatefulSets application. DaemonSets.

Hands-on step: we will deploy StatefullSet application.

## 6. Scaling: Scaling nodes, Scaling pods (manually, auto-scaling by CPU and custom metrics)

We will describe how to scale our applications in a few ways with a practice in our Kubernetes cluster.

## 7. Secrets and ConfigMaps

This is step will explain how to manage secrets and ConfigMaps in Kubernetes.

## 8. Ingress controllers

We will describe when we need Ingress and how to use in our Kubernetes cluster.

## 9. Advances scheduling

Tips and tricks in Kubernetes: Advanced scheduling and which benefits we will get to work with it.

## 10. Java Specific cases

The Java application can be complicated in usage in Docker container and you need some additional knowledge use it right. Let’s talk about it.

## 11. Practical case with Java App in GKE

Hands-on step: Let’s try to work with Java in our Kubernetes cluster.
