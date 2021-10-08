#!/bin/bash
while ! grep "kube-start" katacoda-foreground-finished;do sleep 10;done
rm /etc/kubernetes/manifests/kube-scheduler.yaml 
kubectl delete kube-scheduler-minikube -n kube-system && echo \
    "scheduler-dead" >> /root/katacoda-foreground-finished

while ! grep "scheduler-dead" katacoda-foreground-finished;do sleep 10;done
kubectl apply -f /root/assets/web-svr.yaml

#echo "done" >> /root/katacoda-background-finished
