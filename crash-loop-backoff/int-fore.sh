#! /bin/bash
minikube start &
wait

echo "kube-started" >> /root/katacoda-foreground-finished
