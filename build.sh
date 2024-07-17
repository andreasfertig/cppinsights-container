#! /bin/bash

LOG_FILE=`date +%s`.log

gbench_version=$1
boost_version=`echo $2 | sed 's/\./_/g'`
ARCH=$3

docker info

set -o pipefail
docker build                                        \
       --platform linux/${ARCH}                     \
       --build-arg gbench_version="$gbench_version" \
       --build-arg boost_version="$boost_version"   \
       -t insights-testtest:${ARCH} .
if [ "$?" != "0" ]; then
    echo "Dockerbuild (itself) ${ARCH} failed"
    exit 1
fi

docker tag insights-testtest:${ARCH} insights-testtest:latest

ls -l
docker images

SKIP_LIBCPP=0

# GitHub action ARM docker crashes possibly with OOM for libc++ test.
if [[ "${ARCH}" == "arm64" ]]; then
    SKIP_LIBCPP=1
fi

DOCKER_DEFAULT_PLATFORM=linux/${ARCH} ./test.sh ${SKIP_LIBCPP}

if [ "$?" != "0" ]; then
    echo "Dockerbuild ${ARCH} failed"
    exit 1
else
    # active ate the new docker
    docker tag insights-testtest:${ARCH} cppinsights-container:${ARCH}
fi
