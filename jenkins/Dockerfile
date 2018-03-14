FROM docker.io/centos:7
LABEL maintainer="Ilya Kharlamov <ikharlamov@griddynamics.com>" \
      description="Centos 7 with jenkins"
ARG JENKINS_UID=1000
ARG JENKINS_GUID=1000
ARG JENKINS_LINK=http://mirrors.jenkins.io/war-stable/latest/jenkins.war
ENV JENKINS_HOME=/var/jenkins/
RUN groupadd -g $JENKINS_GUID jenkins && \
    useradd jenkins -u $JENKINS_UID -g $JENKINS_GUID -d $JENKINS_HOME && \
    mkdir -p /usr/share/jenkins
RUN yum install -y java-1.8.0-openjdk-devel \
                   java-1.7.0-openjdk-devel \
                   java-1.6.0-openjdk-devel \
                   which unzip git && \
    curl -L "$JENKINS_LINK" -o /usr/share/jenkins/jenkins.war
COPY files/ /
COPY plugins.list /usr/share/jenkins/plugins.list
RUN chmod +x /usr/share/jenkins/*.sh && \
    chown -R jenkins:jenkins /usr/share/jenkins/ && \
    /usr/share/jenkins/plugins-install.sh < /usr/share/jenkins/plugins.list
ENTRYPOINT ["/usr/share/jenkins/start-jenkins.sh"]
