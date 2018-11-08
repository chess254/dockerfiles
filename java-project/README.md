Java project container, use for running Maven and Gradle projects.

Contains a cache of dependencies (like JUnit) to speed up code execution. You'll find this cache in the docker container at `~/.m2` (and so will Maven!).

Added [instructions to the wiki](https://github.com/CodeSignal/dockerfiles/wiki/Add-Java-Dependencies-with-Maven) for how to test dependencies and add new ones.
