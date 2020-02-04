There's a few reason why a pod is in a CrashLoopBackoff state, these are generally a failing liveness probe, the application is crashing or a problem with the container command.

For the purpose of this exercise we can assume that the application isn't crashing and that the container command is present and correct, leaving us with a probable issue with a liveness probe. How do we determine if this is the case?

If we have a single failing pod we can simply run `kubectl describe pod xyz` where xyz is the name of the failing pod. If we have more than one you can get all events in the current namespace which should show you a number of faling liveness probes `kubectl get events --sort-by=.metadata.creationTimestamp`

This confirms our theory that a livenessprobe is the cause of the issue and its returning a statuscode of 404. Our health check endpoint should be /healthz, lets take a look at what the pod is configured with.

`kubectl get pod -oyaml`, this is going to return the full pod spec, you could use jsonpath output to return just he endpoint path `kubectl get pods -o jsonpath='{.items[*].spec.containers[*].livenessProbe.httpGet.path}'` but its a bit unwieldy and you can achieve a decent result with a simple grep statement `kubectl get pods -o yaml | grep livenessProbe -A5`

The pods liveness probe is configured to check /nonexistentendpoint, its a fair to assume that this doesn't exist and we should change it to /healthz


Continue to the next step for instructions on how to do this.



