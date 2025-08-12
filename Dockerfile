FROM rancher/agent:v1.2.11

ENV DOCKER_URL=https://get.docker.com/builds/Linux/x86_64/docker-1.13.1.tgz
RUN mkdir -p /tmp/download && \
    curl -L ${DOCKER_URL} | tar -xz -C /tmp/download && \
    rm -rf /tmp/download/docker/dockerd && \
    mv /tmp/download/docker/docker* /usr/bin/ && \
    chmod +x /usr/bin/docker* && \
    rm -rf /tmp/download

ENV DAPPER_ENV REPO TAG DRONE_TAG
ENV DAPPER_SOURCE /go/src/github.com/rancher/agent/
ENV DAPPER_OUTPUT ./bin ./dist
ENV DAPPER_DOCKER_SOCKET true
ENV TRASH_CACHE ${DAPPER_SOURCE}/.trash-cache
ENV HOME ${DAPPER_SOURCE}
WORKDIR ${DAPPER_SOURCE}

ENTRYPOINT ["./scripts/entry"]
CMD ["ci"]
