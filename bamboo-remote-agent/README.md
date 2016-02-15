# Docker image for remote Bamboo build agents for HTRC

**Requirement:** The environment variable `$BAMBOO_TOKEN` needs to be defined when running the container; this is the security token needed to authenticate the agent to the Bamboo server.
 
This image is using Debian Jessie as base and has the following capabilities:
 * Oracle JDK 1.7
 * Oracle JDK 1.8 (default)
 * Ant 1.9.6
 * Maven 3.3.9
 * SBT 0.13.9

The Docker capability can be added by running the container in a way that mounts the host's Docker binary and socket on the container. Upon startup the Bamboo agent will automatically detect this capability.

```
docker run -d -e BAMBOO_TOKEN=... \
           -v /var/run/docker.sock:/var/run/docker.sock \
           -v /usr/bin/docker:/usr/bin/docker \
           ...
```
