#!/usr/bin/env groovy

def addTask(jobFolder, jobName, jobRepo){

    folder(jobFolder) {
        description(jobFolder + ' folder')
    }

    pipelineJob(jobFolder + "/" + jobName) {

        def repo = jobRepo

        description(jobFolder + " " + jobName + ' job')

        definition {
            cpsScm {
                scm {
                    git {
                        remote {
                                url(repo)
                               }
                        branches('master')
                        scriptPath('jobs/' + jobFolder.toLowerCase() + "-" + jobName)
                        extensions { }
                    }
                }
            }
        }
    }
}

def jobRepo = "https://github.com/gridu/noc-jenkins.git"

for(i in 1..4) {
    addTask "Task${i}", "build", jobRepo
}


folder('Task5') {
    description('Task5 folder')
}

freeStyleJob('Task5/build') {
    jdk('jdk8')

    scm {
        git {
            remote {
                url("https://github.com/jenkins-docs/simple-java-maven-app.git")
                branches('master')
            }

        }

        steps {
            maven {
                goals('clean')
                goals('package')
                mavenInstallation('M3')
            }
        }

        publishers {
            buildDescription('\\[INFO\\] Building\\s(\\[.*\\])\\s(.\\*)', 'App: \\1<br>Ver: \\2')
        }
    }
}
