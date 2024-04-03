#! /bin/bash

SKIP_LIBCPP=$1

function run_docker()
{
    file=$1
    useLibcpp=$2
    arg=''

    if [[ ${useLibcpp} -eq 1 ]]; then
        echo "With libc++"
        arg="-use-libc++"

    else
        echo "With libstdc++"
    fi

    # --security-opt seccomp=unconfined is required for gdb to turn of randomization
    docker run -h insights-testtest  --net=none -v ${file}:/home/insights/insights.cpp --rm -i --security-opt seccomp=unconfined insights-testtest ${arg} -- -std=c++17
}

function run_test()
{
    file=$1

    run_docker ${file} 0
    retNoLibcpp=$?

    if [[ $SKIP_LIBCPP == 0 ]]; then
        run_docker ${file} 1
        retLibcpp=$?

        [[ $retNoLibcpp == 0 ]] && [[ $retLibcpp == 0 ]]
    else
        [[ $retNoLibcpp == 0 ]]
    fi
}

run_test `pwd`/byte.cpp
if [[ $? != 0 ]]; then
    echo "Failed to compile byte.cpp"
    exit 1
fi

run_test `pwd`/test.cpp
if [[ $? != 0 ]]; then
    echo "Failed to compile test.cpp"
    exit 1
fi

run_test `pwd`/limits.cpp
if [[ $? != 0 ]]; then
    echo "Failed to compile limits.cpp"
    exit 1
fi

run_test `pwd`/benchmark.cpp
if [[ $? != 0 ]]; then
    echo "Failed to compile benchmark.cpp"
    exit 1
fi

run_test `pwd`/boost.cpp
if [[ $? != 0 ]]; then
    echo "Failed to compile boost.cpp"
    exit 1
fi

exit 0
