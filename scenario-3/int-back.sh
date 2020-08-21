#!/bin/bash
while ! grep "kube-start" kube-started;do sleep 10;done

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ResourceQuota
metadata:
  name: compute-resources
  namespace: default
spec:
  hard:
    limits.cpu: "25m"
    limits.memory: 10Mi
    requests.cpu: "25m"
    requests.memory: 10Mi
EOF
clear
kubectl apply -f web-svr.yaml && echo "deploy-complete" >> /root/katacoda-foreground-finished

while ! grep "deploy-complete" katacoda-foreground-finished;do sleep 10;done

echo "Environment setup is complete"