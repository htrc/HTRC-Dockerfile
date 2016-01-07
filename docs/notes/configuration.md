# How Configure Services Running Inside Containers

Every container will have a data volume mounted at /data and all
the configurations and resources should be loaded from there. Special data
volume container [https://docs.docker.com/userguide/dockervolumes/](https://docs.docker.com/userguide/dockervolumes/)
will be used to keep the configuration consistent across different
deployment environments. This container will be named 'sharc-data' across all
the deployment environments.

## How To Create a Data Volume Container

```
$ docker create -v /hathitrustmnt/sharc/production/data:/data:ro --name sharc-data phusion/baseimage:0.9.16 /bin/true
```

In the above command we assume we keep all the resources and configurations
related to *production* stack under */hathitrustmnt/sharc/production/data* and
we mount it to *sharc-data* container at */data*.

## How To Mount a Volume From Data Volume Container

```
$ docker run -d --volumes-from sharc-data --name idpandregistry htrc/postgres
```

# Configuration Directory Hierarchy

Below ASCII diagram shows a possible layout for data volume.


```
data
|-- htrc-portal
|   |-- conf
|   |-- resources
|
|-- idp
|   |-- conf
|
|-- workset-builder
```

# Service Discovery

* http://blog.scottlowe.org/2015/03/06/running-own-docker-swarm-cluster/
* http://blog.arungupta.me/docker-swarm-cluster-using-consul/
* http://technologyconversations.com/2015/07/02/scaling-to-infinity-with-docker-swarm-docker-compose-and-consul-part-24-manually-deploying-services/
