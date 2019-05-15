#! /bin/sh

# --security-opt seccomp=unconfined is required for gdb to turn of randomization

# ./r.sh /Users/jim/tmp/llvm_git/llvm/tools/clang/tools/extra/insights/tests/AutoHandler2Test.cpp
docker run -h insights-testtest  --net=none -v $1:/home/insights/insights.cpp --rm -i --security-opt seccomp=unconfined insights-testtest -- -std=c++17

