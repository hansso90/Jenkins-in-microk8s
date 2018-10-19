FROM jenkinsci/slave:3.26-1


USER root
# Install docker(-compose) tool
RUN curl https://download.docker.com/linux/static/stable/x86_64/docker-17.09.0-ce.tgz | tar xvz docker/docker -C /tmp; \
    mv docker/docker /usr/local/bin/docker; \
    curl -L https://github.com/docker/compose/releases/download/1.17.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
USER jenkins
