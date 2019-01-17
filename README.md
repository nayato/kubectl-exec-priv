# kubectl-exec-priv

## Overview

Fork of [kubectl-exec-user](https://github.com/mikelorant/kubectl-exec-user) with a tweak to use `--privileged` instead of overriding user.

Execute command as privileged in a Kubernetes container.

This works by creating a pod on the same node as the container and mounting the docker socket into this container. The container runs the docker application which has access to the hosts containers and is able to use the exec command with the user flag.

## Install

Run the install script to copy the plugin to `~/.kube/plugins`.

```shell
./install.sh
```

## Usage

```shell
exec-priv $POD $COMMAND [$CONTAINER]
```

If the command is not specified, falls back to the `sh` command.

### Flags

| Name      | Shorthand | Default   | Usage                                                                     |
|-----------|-----------|---------- |---------------------------------------------------------------------------|
| container | -c        |           | Container name. If omitted, the first container in the pod will be chosen |
| name      | -o        | exec-priv | Name for new exec-priv pod to avoid `pods "exec-priv" already exists`     |                           |  

## Examples

Exec `sh` in first container in `example` pod as privileged.

```shell
kubectl plugin exec-priv example
```

Exec `bash` in first container in `example` pod as privileged.

```shell
kubectl plugin exec-priv example bash
```

Exec `bash` in `second` container in `example` pod as privileged.

```shell
kubectl plugin exec-priv -c second -u admin example-pod bash
```
