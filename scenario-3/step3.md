Realistically we have two options for resolution here, one would be to remove the requirement for the secret from the pod deployment, but this is likely to introduce other problems so we won't do that. The second option is to create the missing secret.

You've a couple of options on how to create the secret, you could create a **yaml** **spec** and apply it via **kubectl** or you can just use **kubectl**, which is the option we'll go for this time. Let's create our secret:

`kubectl create secret generic web-svr-secrets --from-literal=super-secret=thisisasecret`{{execute}}

This creates a generic secret called **web-svr-secrets**, which holds a key **super-secret** with the value **thisisasecret**.
If you want to see what this looks like once created run: 

`kubectl get secret web-svr-secrets -o yaml`{{execute}}

(you should notice that key **super-secret** has had its value encrypted).

We should see our pod is now running:

`kubectl get pods`{{execute}}

Congratulations, now you've created a secret your pod should now be fit and healthy.
