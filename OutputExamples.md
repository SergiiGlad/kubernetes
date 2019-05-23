#
# output last terminated reason not null (Error OOMKilled)
#

kubectl  get po  -n namespaces -o json \
  | jq '.items[].status.containerStatuses[].lastState.terminated.reason' \
  | grep -v null

#
# name all pod
#

kubectl  get po  --all-namespaces \
-o go-template --template='{{range .items}}{{printf "%s \n" .metadata.name }}{{end}}'

kubectl get po --all-namespaces --sort-by=.metadata.name

#
# metadata  pod 1
#
kubectl get po  --all-namespaces -o json | jq '.items[1]'

kubectl get po --all-namespaces -o jsonpath='{.spec[48]}'  dashboard-settings-7d7597d89f-44k4c

#
# list pods sorted by restart config_out
#

kubectl get po --all-namespaces  --sort-by='status.containerStatuses[0].restartCount'

#
# go template with index
#
kubectl  get po  --all-namespaces  \
-o go-template --template='{{with index  .items 48}}{{}} {{printf "%s %s \n" .metadata.name .status}}{{end}}'

kubectl  get po  --all-namespaces  -o go-template --template='
{{with index .items 48}}
{{printf "%s " .metadata.name }}
  {{range .status.containerStatuses }}
           {{printf "%s \n" .terminated }}
    {{end}}
  {{end}}
{{end}}'


kubectl  get po  --all-namespaces  -o go-template --template='
{{with index .items 48}}
  {{printf "%s " .metadata.name }}
    {{ range .status.containerStatuses}}
        {{if .lastState}}
           {{printf "%s \n" .lastState.terminated.reason}}
          {{end}}
    {{end}}
{{end}}'

kubectl get po --all-namespaces  -o go-template --template='
{{range .items }}
  {{$name := .metadata.name}}
  {{$namespace := .metadata.namespace}}
  {{$nodeName := .spec.nodeName}}
  {{$phase := .status.phase }}
      {{ range .status.containerStatuses}}
        {{if .lastState}}
             {{printf "%15s %35s %15s %15s %10s %10.f %s\n" $name $namespace $nodeName .lastState.terminated.reason .lastState.terminated.finishedAt .restartCount $phase}}
          {{end}}
    {{end}}
{{end}}'
