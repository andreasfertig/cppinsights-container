#! /bin/sh

cd $HOME

ulimit -t 10
ulimit -v $((2 * 1024 * 1024))
ulimit -m $((512 * 1024))
#ulimit -e 12

umask 0177

if [ $# -eq 1 ]; then
    /usr/bin/insights /home/insights/insights.cpp --version
    echo ""
    echo -n "insights sha256: "
    sha256sum /usr/bin/insights | cut -d ' ' -f 1
    echo ""
    echo "Used standard libraries:"
    echo "- libstdc++ (the default library): ${GCC_VERSION}"
    echo "- libc++: ${CLANG_VERSION}"
else
    /usr/bin/insights /home/insights/insights.cpp $@
fi

exit $?
