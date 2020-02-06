Welcome to Kubernetes, once the environemt has been configured you will be able to check the state of your application.

If you're not sure how to do this you'll want to run
`kubectl get pods`

This should show you that all is not quite right with your application, a deployment has been attempted, but there's something wrong; it doesn't reach a ready state and the status message is `CreateContainerConfigError`

Your challenge is now to find out why this pod isn't starting. Step 2 will help you diagnose the problem, step 3 will help you to resolve it.
