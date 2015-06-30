# How Configure Services Running Inside Containers

Every container will have a data volume mounted at /data and all
the configurations and resources should be loaded from there. Special data
volume container [https://docs.docker.com/userguide/dockervolumes/](https://docs.docker.com/userguide/dockervolumes/)
will be used to keep the configuration consistent across different
deployment environments. This container will be named 'sharc-data' across all
the deployment environments.

## How To Create a Data Volume Container

```
$ docker create -v /dbdata --name dbdata training/postgres /bin/true
```

## How To Mount a Volume From Data Volume Container

```
$ docker run -d --volumes-from dbdata --name db1 training/postgres
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
