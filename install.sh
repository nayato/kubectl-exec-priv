#!/usr/bin/env bash

mkdir -p ~/.kube/plugins

cp -r exec-priv ~/.kube/plugins/
chmod +x ~/.kube/plugins/exec-priv.sh
