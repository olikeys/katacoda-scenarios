Welcome to Kubernetes, once the environemt has been configured you will be able to check the state of your application.

If you're not sure how to do this you'll want to run
`kubectl get pods`

This should show you that all is not quite right with your application, its been deployed it starts to run but after a few seconds it restarts, it does this a few times before it enters the dreaded CrashLoopBackOff state. If you want to watch the restart count increase `watch -n 1 kubectl get pods`

Your challenge is now to find out why your application is restarting and fix it. Step 2 will help you diagnose the problem, step 3 will help you to resolve it.
