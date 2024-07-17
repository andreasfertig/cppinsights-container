#! /bin/sh

docker run --hostname insights-testtest  \
       --rm                              \
       -it                               \
       --security-opt seccomp=unconfined \
       insights-test                     \
       /bin/bash

