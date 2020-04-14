#!/bin/bash

cd "${0%/*}"

tag=latest

docker run \
  --rm \
  --privileged \
  -i \
  -t \
  codesignal/ubuntu-base:dev
