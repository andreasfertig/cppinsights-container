#! /bin/sh

docker run -h insights-test --rm -it --security-opt seccomp=unconfined insights-test /bin/bash -l

