# Dockerfiles

A collection of Dockerfiles for CodeSignal user code execution. Look at the `README` associated with each individual file to find information no a specific image.

## Creating or editing a Dockerfile

Run your Dockerfile through this linting tool to look for possible bugs or optimizations:
https://www.fromlatest.io/#/

## Releasing new versions

### Updating the image itself:

1. Go to [dockerhub](https://hub.docker.com/?namespace=codesignal), and verify that the image you're updating has an automated build set up for it. The build you're looking for should have the following setup:
   * Docker Tag: `{\1}`
   * Source: `/^YOUR_DOCKER_IMAGE\/(v[0-9.]+)$/`
   * Build Status: can be anything
   * Autobuild: enabled
   * Build caching: enabled
2. Create a new GitHub release tagged with docker image name and new version. It should match automated build source, i.e. be something like `YOUR_DOCKER_IMAGE/IMAGE_VERSION`. For example:
   * `r/v5.1`
   * `java/v4.0.2`
3. Go back to Dockerhub, and verify that the build started successfully.
4. After the build is finished, verify that it was successful, and **make sure there are no errors in the logs**. Sometimes builds finish successfully even though the installation is not fully successful. For example, that's what happened to Swift image in [this](https://cloud.docker.com/u/codesignal/repository/registry-1.docker.io/codesignal/swift/builds/0ba57fcb-7639-448d-b00e-91b89c75765b) build.
   
### Updating image dependencies:

Check out [build dependencies](#build-tree) to figure out if the image you're updating has any dependencies. If it does:

1. Go to [dockerhub](https://hub.docker.com/?namespace=codesignal), and verify that all images that depend on the base image have automated builds set up. The build you're looking for should have the following setup:
   * Docker Tag: `{\1}`
   * Source: `/^based-on\/YOUR_DOCKER_IMAGE\/(v[0-9.]+)$/`
   * Build Status: can be anything
   * Autobuild: enabled
   * Build caching: enabled
2. Create a new GitHub release tagged with docker image name and new version. It should match automated build source, i.e. be something like `based-on/YOUR_DOCKER_IMAGE/IMAGE_VERSION`. For example:
   * `based-on/ubuntu-base/v5.0`
   * `based-on/java/v5.0`
   
   Make sure `IMAGE_VERSION` will work for all of the dependencies!
3. For every dependent image, verify that the build started and finished successfully.
4. If one of the dependencies, in turn, has other dependencies, repeat these steps for the `UPDATED_IMAGE`. This should only happen if you update `ubuntu-base`.
   
## <a name="build-tree"></a>Build dependencies:

* ubuntu-base
  * acceptance-tests
  * coffeescript
  * cpp
  * cs
  * d-env
  * dart
  * dotnetcore
  * erlang
    * elixir
  * go
  * haskell
  * java
    * clojure
    * groovy
    * java-project
    * kotlin
    * scala
  * js
  * julia-1
  * lisp
  * lua
  * nim
  * ocaml
  * octave
  * pascal
  * perl
  * php
  * python
  * r-env
  * ruby
  * rust
  * smalltalk
  * swift
  * tcl
  * typescript
* mysql
* galen
