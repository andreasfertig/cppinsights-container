FROM ubuntu:18.04

LABEL maintainer "Andreas Fertig"

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates gnupg wget

RUN echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-8 main" >> /etc/apt/sources.list
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -

RUN apt-get update && apt-get install -y --no-install-recommends libstdc++-7-dev libclang-8-dev && apt-get clean

RUN apt-get remove --purge --auto-remove -y --force-yes wget ca-certificates openssl dirmngr

RUN useradd insights \
    && mkdir /home/insights \
    && chown -R insights:insights /home/insights

COPY run_in_docker.sh /
RUN chmod 0755 /run_in_docker.sh

RUN rm -rf /var/log/*            && \
    rm -rf /var/cache/*          && \
    rm -rf /usr/share/doc/*      && \
    rm -rf /usr/share/doc-base/* && \
    rm -rf /usr/share/dh-python  && \
    rm -rf /usr/share/locale     && \
    rm -rf /usr/share/perl       && \
    rm -rf /usr/share/perl5      && \
    rm -rf /usr/share/lintian    && \
    rm -rf /usr/share/info/*     && \
    rm -rf /usr/share/gdb        && \
    rm -rf /usr/share/zoneinfo   && \
    rm -rf /usr/share/bug        && \
    rm -rf /usr/lib/python3.4/   && \
    rm -rf /usr/lib/locale/      && \
    rm -rf /usr/lib/perl         && \
    rm -rf /usr/lib/perl5        && \
    rm -rf /usr/share/man/*

RUN chown -R insights:insights /home/insights

COPY insights /usr/bin/insights
RUN chmod 0755 /usr/bin/insights

USER insights

#CMD ["/run_in_docker.sh"]
ENTRYPOINT ["/run_in_docker.sh"]
CMD []
