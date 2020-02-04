#!/bin/bash

while ! grep "Completed" katacoda-finished;do sleep 10;done

echo "done" >> /root/katacoda-background-finished

kubectl apply -f /root/assets/web-svr.yaml
