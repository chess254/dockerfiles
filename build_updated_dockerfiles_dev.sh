#!/bin/bash

echo Starting

declare -A REPOMAP
REPOMAP[r]='r-env'
REPOMAP[d]='d-env'
REPOMAP[base]='ubuntu-base'

echo "$DOCKERHUB_PASSWORD" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin

echo ---DOCKERHUB_PASSWORD $DOCKERHUB_PASSWORD
echo ---DOCKERHUB_USERNAME $DOCKERHUB_USERNAME
echo --PWD
pwd
ls
echo ------Logged Into docker

echo ------List of updated files
FILES=$(git diff-tree --name-only -r origin/master HEAD)
for F in $FILES; do echo $F; done

REGEX="(.*)\/Dockerfile"
for F in $FILES
do
  if [[ $F =~ $REGEX ]]
  then
    IMAGE=${BASH_REMATCH[1]}

    if [ ${REPOMAP[${IMAGE}]+_} ]
    then
      REPO=${REPOMAP[${IMAGE}]}
    else
      REPO=$IMAGE
    fi

    echo dockerfile: $IMAGE '->' repo: $REPO
    docker build -t codesignal/$REPO:dev $IMAGE > /dev/null
    echo Exit code $?

    echo "Trying to push with dev tag"
    docker push codesignal/$REPO:dev
  fi
  echo --------------------------------------------------------------------
done