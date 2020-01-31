There are a few ways to correct the liveness probe, we can patch the deployment, roll it out again or edit on the fly. In an ideal world we'd update the manifest, get some form of approval for the change and then roll it out. Sadly we don't always live in an ideal world, especially if its 3am and you've got a pod crashing. Its at those times we have to resort to `kubectl`.

The quickest and easist way to fix this is to run `kubectl edit deployment web-svr`, the danger with this is it leaves you open to editing a lot more than just the problematic liveness probe. An alternative that allows for a little extra control is to patch the deployment.

Create a file called patch-file.yaml and copy the following content into it

```
spec:
  template:
    spec:
      containers:
      - name: web-svr
        livenessProbe:
          httpGet:
            path: /healthz
```{{copy}}

Save it and exit back to your terminal. Now run the following `kubectl patch deployment web-svr --patch "$(cat patch-file.yaml)"`. Doing it via this patch file means we are only going to be changing the liveness probe for the web-svr container.

Congratulations, your pod should now be fit and healthy.
