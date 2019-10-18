#! /bin/sh

# --security-opt seccomp=unconfined is required for gdb to turn of randomization

echo "With libstdc++"
docker run -h insights-testtest  --net=none -v $1:/home/insights/insights.cpp --rm -i --security-opt seccomp=unconfined insights-testtest -- -std=c++17

echo "With libc++"
docker run -h insights-testtest  --net=none -v $1:/home/insights/insights.cpp --rm -i --security-opt seccomp=unconfined insights-testtest -use-libc++ -- -std=c++17
