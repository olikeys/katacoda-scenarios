#!/bin/bash
while ! grep "kube-start" katacoda-foreground-finished;do sleep 10;done

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
kubectl apply -f /root/assets/web-svr.yaml

#echo "done" >> /root/katacoda-background-finished
