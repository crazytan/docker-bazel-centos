# docker-bazel-centos
Provides latest bazel build for CentOS. Current version is 0.5.2

## Usage
The usage is similar to other bazel images:
```console
$ docker run --rm -v "$PWD":/usr/src/app -d crazytan/bazel bazel "BAZEL COMMAND"
```
