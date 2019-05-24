#!/usr/bin/env sh
#
#
#
#

printf "%20s %50s %10s %7s %20s %10s %s\n" "NameSpace" "PodName" "Reason" "Restart" "TerminateAt" "NowState" "NodeName"

kubectl get po --all-namespaces -o go-template --template='{{range .items }}   {{$name := .metadata.name}}   {{$namespace := .metadata.namespace}}   {{$nodeName := .spec.nodeName}} {{$phase := .status.phase }}       {{ range .status.containerStatuses}}         {{if .lastState}}              \
{{printf "%20s %50s %10s %7.f %20s %10s %s\n" $namespace  $name  .lastState.terminated.reason  .restartCount .lastState.terminated.finishedAt $phase $nodeName}}           {{end}}     {{end}} {{end}}' | grep "Running" | sort -k 7
