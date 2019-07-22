## Kubernetes pod can be associated with a service account

by default, it is associated with the default service account

The associated token is exposed to the pod's filesystem

__/var/run/secrets/kubernetes.io/serviceaccount/token__
