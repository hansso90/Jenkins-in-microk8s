FROM jenkins/jenkins:2.147-slim
LABEL maintainer="hansso90"

#Memory settings
ENV JAVA_OPTS="-Xmx8192m -"

#Connection pool
ENV JENKINS_OPTS=" --handlerCountMax=300"

####---plugin:---###

# Distributed Builds plugins
RUN /usr/local/bin/install-plugins.sh ssh-slaves

RUN /usr/local/bin/install-plugins.sh slack

RUN /usr/local/bin/install-plugins.sh simple-theme-plugin

RUN /usr/local/bin/install-plugins.sh greenballs

RUN /usr/local/bin/install-plugins.sh kubernetes

RUN /usr/local/bin/install-plugins.sh configuration-as-code

RUN /usr/local/bin/install-plugins.sh workflow-aggregator

RUN /usr/local/bin/install-plugins.sh docker-plugin

RUN /usr/local/bin/install-plugins.sh docker-workflow

RUN /usr/local/bin/install-plugins.sh git

RUN /usr/local/bin/install-plugins.sh github

####---docker:---###

USER root
RUN groupadd docker
RUN usermod -a -G docker jenkins
#RUN apt-get update -qq \
#    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common
#RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
#RUN add-apt-repository \
#   "deb [arch=amd64] https://download.docker.com/linux/debian \
#   $(lsb_release -cs) \
#   stable"
#RUN apt-get update  -qq \
#    && apt-get install docker-ce=17.12.1~ce-0~debian -y

USER jenkins
