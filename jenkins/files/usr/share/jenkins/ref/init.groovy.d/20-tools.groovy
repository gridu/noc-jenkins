import jenkins.model.Jenkins
import hudson.model.JDK
import hudson.tasks.Maven.MavenInstallation;
import hudson.tasks.Maven
import hudson.tools.InstallSourceProperty

println("--- Setup tools installations")

JDK jdk6 = new JDK("jdk6", "/usr/lib/jvm/java-1.6.0")
JDK jdk7 = new JDK("jdk7", "/usr/lib/jvm/java-1.7.0")
JDK jdk8 = new JDK("jdk8", "/usr/lib/jvm/java-1.8.0")
Jenkins.instance.getDescriptorByType(JDK.DescriptorImpl.class).setInstallations(jdk6, jdk7, jdk8)

InstallSourceProperty p3 = new InstallSourceProperty([new Maven.MavenInstaller("3.5.3")])
MavenInstallation m3 = new MavenInstallation("M3", null, [p3])
InstallSourceProperty p2 = new InstallSourceProperty([new Maven.MavenInstaller("2.2.1")])
MavenInstallation m2 = new MavenInstallation("M2", null, [p2])
Jenkins.instance.getDescriptorByType(Maven.DescriptorImpl.class).setInstallations(m2, m3)
