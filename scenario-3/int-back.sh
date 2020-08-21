#!/bin/bash
while ! grep "deploy-complete" katacoda-foreground-finished;do sleep 10;done