# Python Dockerfile

This creates the user code execution environment for Python 2 and Python 3.
Conda install provided by the [miniconda3](https://hub.docker.com/r/conda/miniconda3/~/dockerfile/) dockerfile. This also dynamically creates the conda execution environments `py2` and `py3` which should eventually be published on conda. The inclusion of the scientific packages and the `nltk` popular machine learning data sets means this container is quite large.