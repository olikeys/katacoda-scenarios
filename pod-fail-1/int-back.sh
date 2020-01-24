#!/bin/bash

while ! grep "Completed" katakoda-finished;do sleep 10;done

kubectl apply -f /root/assets/web-svr.yaml

echo "done" >> root/katacoda-background-finished
