Portworx requires Ubuntu as the base image for the GKE Nodes

$ gcloud container clusters create "gke-px" \
--zone "us-central1-a" \
--username "admin" \
--cluster-version "1.14.7-gke.10" \
--machine-type "n1-standard-1" \
--image-type "UBUNTU" \
--disk-type "pd-ssd" \
--disk-size "30" \
--num-nodes "3" \
--enable-cloud-logging \
--enable-cloud-monitoring \
--network "default" \
