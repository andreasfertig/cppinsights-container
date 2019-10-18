#! /bin/sh

cd $HOME

ulimit -t 10
ulimit -v $((2 * 1024 * 1024))
ulimit -m $((512 * 1024))
#ulimit -e 12

umask 0177

if [ $# -eq 1 ]; then
    /usr/bin/insights /home/insights/insights.cpp --version
    echo -n "insights sha256: "
    sha256sum /usr/bin/insights | cut -d ' ' -f 1
else
    /usr/bin/insights /home/insights/insights.cpp $@ -resource-dir=/usr/lib/llvm-9/lib/clang/9.0.1
fi

exit $?
