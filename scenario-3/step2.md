The status **CreateContainerConfigError** is a fairly descriptive message, there's a configuration error.

The first thing to do is run:

`kubectl describe pod`{{execute}}

There's only one pod in this namespace so we don't need to worry about specifying the full pod name, if there were multiple pods we'd want to run `kubectl get pod xyz` where `xyz` is the name of your failing pod.

Here we see we have an event warning with a message `Error: secret "web-svr-secrets"` not found. Although its only a warning it is the reason why the pod is failing to create. If we run:

`kubectl get deployment -o yaml`{{execute}}

We can see that our container is expecting a secret so that we can create an environment variable from it.

Does this secret exist in our namespace? If we run:

`kubectl get secrets`{{execute}}

It reveals we have a single secret and its not the one that we're after.

Go to Step 3 for help in fixing the issue
