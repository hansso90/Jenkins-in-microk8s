FROM jenkins/jenkins:2.147-slim
LABEL maintainer="pdok@pdok.nl"

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
