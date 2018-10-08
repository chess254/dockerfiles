# Dockerfiles
A collection of Dockerfiles for CodeSignal user code execution. For now, look at the `README` associated with each individual file.

We are working to migrate all of these Dockerfiles to extend from the `base`.

## Instructions for releasing new versions
Note - If you're updating a base version that other containers extend, update the files to reference the yet-to-be-created version of the base container.
1. Create a new github release tagged with a version, `v1.2.3`
1. Go to [dockerhub](https://hub.docker.com/r/codesignal/)
1. Edit the build settings of updated languages to include a new build for the tag associated with the github release. If you have an update to a `base`, you'll need to go and create tagged releases for all dockerfiles that extend that base version.