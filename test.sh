#! /bin/sh

./r.sh `pwd`/byte.cpp
if [ "$?" != "0" ]; then
    echo "Failed to compile byte.cpp"
    exit 1
fi

./r.sh `pwd`/test.cpp
if [ "$?" != "0" ]; then
    echo "Failed to compile test.cpp"
    exit 1
fi

./r.sh `pwd`/limits.cpp
if [ "$?" != "0" ]; then
    echo "Failed to compile limits.cpp"
    exit 1
fi

./r.sh `pwd`/benchmark.cpp
if [ "$?" != "0" ]; then
    echo "Failed to compile benchmark.cpp"
    exit 1
fi

./r.sh `pwd`/boost.cpp
if [ "$?" != "0" ]; then
    echo "Failed to compile boost.cpp"
    exit 1
fi

exit 0
