First let's start our cluster:

`minikube start --wait=false`{{execute}}

And let's deploy our app:

`kubectl apply -f web-svr.yaml`{{execute}}

Let's check the status of our pods and wait until they are created. If you're not sure how to do this you'll want to run: 

`kubectl get pods`{{execute}}

This should show you that all is not quite right with your application, a deployment has been attempted, but there's something wrong; it doesn't reach a ready state and the status message is **CreateContainerConfigError**:

`watch -n 1 kubectl get pods`{{execute}}

To stop watching focus the terminal and press `CTRL + c`

Your challenge is now to find out why your application is restarting and fix it. Step 2 will help you diagnose the problem, step 3 will help you to resolve it.
