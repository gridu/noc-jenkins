#!/bin/bash

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

if [ ! -d "/var/jenkins/init.groovy.d/" ];
    then
    echo "--- Copying reference files"
    cp -r /usr/share/jenkins/ref/* /var/jenkins/
    else
    echo "--- Jenkins home already exists"
fi

echo "--- Starting jenkins"
chown -R jenkins:jenkins /var/jenkins/
su jenkins -c '/usr/bin/java \
               -Djenkins.install.runSetupWizard=false \
               -Dhudson.model.DirectoryBrowserSupport.CSP="" \
               -Xmx256m \
               -jar /usr/share/jenkins/jenkins.war'
