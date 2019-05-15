#! /bin/bash

LOG_FILE=`date +%s`.log

set -o pipefail
docker build -t insights-testtest `pwd` 2>&1 | tee ${LOG_FILE}
if [ "$?" != "0" ]; then
    cat ${LOG_FILE} | Mail -s "Dockerbuild (itself) failed" root
    exit 1
fi

./test.sh 2>&1 | tee -a ${LOG_FILE}

if [ "$?" != "0" ]; then
    cat ${LOG_FILE} | Mail -s "Dockerbuild failed" root
else
    # active ate the new docker
    docker tag insights-testtest insights-test 2>&1 | tee -a ${LOG_FILE}
fi
