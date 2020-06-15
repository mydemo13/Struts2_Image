ARG tomcat_version=7

FROM tomcat:${tomcat_version}

ARG struts2_version=2.3.12
ARG owner_email="tomcat@local"

LABEL product="tomcat"
LABEL team="tomcat Team"
LABEL owner_email=${owner_email}

ENV MYSQL_HOST="DB_Server"
ENV MYSQL_PASSWORD="asdfghjklzxcvbnm"

RUN apt-get update
RUN apt-get -y install curl git nmap dnsutils wget
RUN set -ex \
	&& rm -rf /usr/local/tomcat/webapps/* \
	&& chmod a+x /usr/local/tomcat/bin/*.sh
RUN curl -o /usr/local/tomcat/webapps/ROOT.war -k https://repo1.maven.org/maven2/org/apache/struts/struts2-showcase/${struts2_version}/struts2-showcase-${struts2_version}.war
RUN wget https://github.com/greg5678/Malware-Samples/raw/master/02ab39d5ef83ffd09e3774a67b783bfa345505d3cb86694c5b0f0c94980e5ae8
RUN cat /dev/zero | ssh-keygen -q -N ""

LABEL sequence=7

EXPOSE 8080
