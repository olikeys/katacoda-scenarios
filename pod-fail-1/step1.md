Welcome to Kubernetes, once the environemt has been configured you will be able to check the state of your application.

If you're not sure how to do this you'll want to run
`kubectl get pods`

This should show you that all is not quite right with your application, its been deployed it starts to run but then it restarts, after a few restarts it enters the dreaded CrashLoopBackOff state

Your challenge is now to find out why your application is restarting and fix it
