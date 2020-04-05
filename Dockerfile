FROM andreasfertig/cppinsights-docker-base:latest

LABEL maintainer "Andreas Fertig"

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

COPY run_in_docker.sh /
RUN chmod 0755 /run_in_docker.sh

COPY insights /usr/bin/insights
RUN chmod 0755 /usr/bin/insights

RUN mkdir -p /opt/libs
ADD benchmark-1.3.0/include /opt/libs/benchmark-1.3.0

RUN find /opt/libs -type d -exec chmod go+rx {} + && \
    find /opt/libs -type f -exec chmod go+r {} +

RUN ln -sf /opt/libs/benchmark-1.3.0/benchmark /usr/include/benchmark && \
    ls -l  /opt/libs && \
    ls -lR /usr/include/benchmark/

USER insights

#CMD ["/run_in_docker.sh"]
ENTRYPOINT ["/run_in_docker.sh"]
CMD []
