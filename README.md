# Dockerfiles
A collection of Dockerfiles for CodeSignal user code execution. For now, look at the `README` associated with each individual file.

We are working to migrate all of these Dockerfiles to extend from the `base`.

## Instructions for releasing new versions
Note - If you're updating a base version that other containers extend, update the files to reference the yet-to-be-created version of the base container.
1. Create a new github release tagged with a version, `v1.2.3`
1. Go to [dockerhub](https://hub.docker.com/r/codesignal/)
1. Edit the build settings of updated languages to include a new build for the tag associated with the github release. If you have an update to a `base`, you'll need to go and create tagged releases for all dockerfiles that extend that base version.
1. If you have created a new dockerfile for a language, you'll need to add that as a new repository on Dockerhub.
   1. Click on "Create Automated Build" from the dropdown at the top.
   1. Create a build from github, select the CodeSignal/dockerfiles github repository.
   1. Name the Dockerhub repo after the language and add a quick description.
   1. Click `click here to customize behavior` link, this will enable you to configure builds by github release tag.
   1. Link to the github release tag you want, release it with the appropriate Dockerhub version. (Current :v1.0 languages all extend base:v1.0, and :v1.1 releases all extend base:v1.1)
   1. Save and confirm that specified tag is building on dockerhub. 
   
