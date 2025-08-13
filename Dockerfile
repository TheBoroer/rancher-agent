FROM rancher/agent:v1.2.11

ENV DOCKER_URL=https://download.docker.com/linux/static/stable/x86_64/docker-18.09.9.tgz
RUN mkdir -p /tmp/download && \
    curl -L ${DOCKER_URL} | tar -xz -C /tmp/download && \
    rm -rf /tmp/download/docker/dockerd && \
    mv /tmp/download/docker/docker* /usr/bin/ && \
    chmod +x /usr/bin/docker* && \
    rm -rf /tmp/download
