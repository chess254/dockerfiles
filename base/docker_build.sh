#!/bin/bash

cd "${0%/*}"

tag="latest"

docker build -t codesignal/ubuntu-base:dev .
#docker build --no-cache -t baseimage:${tag} .
