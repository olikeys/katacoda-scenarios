There's a few reason why a pod is in a CrashLoopBackoff state, these are generally a failing liveness probe, the application is crashing or a problem with the container command.

For the purpose of this exercise we can assume that the application isn't crashing and that the container command is present and correct, leaving us with a probable issue with a liveness probe. How do we determine if this is the case?

There's a few options we can use to confirm our suspicions
`kubectl describe pods`{{copy}}
`kubectl get events --sort-by=.metadata.creationTimestamp`{{copy}}

The first command, as it suggests describes the pods in the namespace, if you wanted to describe a single pod you'd simply add the pod name to the end of the command. The seconds command returns all the recent events for the namespace you're in.

Output from either command should point us to a livenessprobe being the cause of the issue as its returning a statuscode of 404. Our health check endpoint should be /healthz, lets take a look at what the pod is configured with.

Again, there's plenty of ways you can get to the information you need
`kubectl get pod -oyaml`{{copy}}
`kubectl get pod -o jsonpath='{.items[*].spec.containers[*].livenessProbe.httpGet.path}'`{{copy}}

Both are going to show you what you need to know, but using jsonpath and the exact option you want returned will save you a fair chunk of scrolling. Personally, I usually get the full yaml spec and chuck a grep in there to drop all the noise `kubectl get pods -oyaml | grep livenessProbe -A5`

The pods liveness probe is configured to check /nonexistentendpoint, its a fair to assume that this doesn't exist and we should change it to /healthz

Continue to the next step for instructions on how to do this.



