#!/bin/bash
while ! grep "kube-start" katacoda-foreground-finished;do sleep 10;done

kubectl apply -f /root/assets/web-svr.yaml

#echo "done" >> /root/katacoda-background-finished

