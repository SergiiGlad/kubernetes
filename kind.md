after installing **kind**

https://github.com/kubernetes-sigs/kind/blob/main/images/base/Dockerfile

```bash
kubectl get po -A

NAMESPACE NAME                                         READY   STATUS    RESTARTS       AGE
kube-system          coredns-7d764666f9-2jvjv                     1/1     Running   2 (6d4h ago)   8d
kube-system          coredns-7d764666f9-zndbg                     1/1     Running   2 (6d4h ago)   8d
kube-system          etcd-kind-control-plane                      1/1     Running   2 (6d4h ago)   8d
kube-system          kindnet-hm5k6                                1/1     Running   2 (6d4h ago)   8d
kube-system          kube-apiserver-kind-control-plane            1/1     Running   2 (6d4h ago)   8d
kube-system          kube-controller-manager-kind-control-plane   1/1     Running   2 (6d4h ago)   8d
kube-system          kube-proxy-pbcq9                             1/1     Running   2 (6d4h ago)   8d
kube-system          kube-scheduler-kind-control-plane            1/1     Running   2 (6d4h ago)   8d
local-path-storage   local-path-provisioner-67b8995b4b-l6jl7      1/1     Running   4 (6d4h ago)   8d

```

```bash
docker ps


CONTAINER ID   IMAGE                  COMMAND                  CREATED      STATUS      PORTS                       NAMES
05b7a19a2259   kindest/node:v1.35.0   "/usr/local/bin/entr…"   8 days ago   Up 6 days   127.0.0.1:41451->6443/tcp   kind-control-plane

```

```bash
docker exec -ti kind-control-plane sh
ps aux
```
![ps aux](kind.png)
