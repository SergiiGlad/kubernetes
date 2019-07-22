## Kubernetes pod can be associated with a service account

by default, it is associated with the default service account

The associated token is exposed to the pod's filesystem

__/var/run/secrets/kubernetes.io/serviceaccount/token__

Standard Kubernetes tooling (like kubectl) will look for it there
So Kubernetes tools running in a pod will automatically use the service account

Create the new service account:

