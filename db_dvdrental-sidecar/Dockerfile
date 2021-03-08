FROM asimio/db_dvdrental:latest
MAINTAINER Orlando L Otero ootero@asimio.net, https://bitbucket.org/asimio/postgres
# Manually build using command: docker build -t asimio/db_dvdrental-sidecar:latest .

# Install JDK
RUN \
  mkdir -p /usr/lib && \
  wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/jdk-8u162-linux-x64.tar.gz  && \
  tar -zxf jdk-8u162-linux-x64.tar.gz -C /usr/lib && \
  ln -s /usr/lib/jdk1.8.0_162 /usr/lib/jdk && \
  chown -R root:root /usr/lib/jdk && \
  rm jdk-8u162-linux-x64.tar.gz  

ENV JAVA_HOME="/usr/lib/jdk"
ENV PATH="$JAVA_HOME/bin:$PATH"
ENV JAVA_TOOL_OPTIONS="-Xms256M -Xmx256M -Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom"
ENV SPRING_APPLICATION_NAME="POSTGRES-DB_DVDRENTAL"

COPY scripts/sidecar.jar /opt/asimio-cloud/sidecar.jar
# Seems scripts will get executed in alphabetical-sorted order, db-init.sh needs to be executed first, db-restore.sh second and sidecar.sh last.
ADD scripts/sidecar.sh /docker-entrypoint-initdb.d/
RUN chmod 755 /docker-entrypoint-initdb.d/sidecar.sh

# Run as:
# Assumes a bridge network (sidecarpostgresdemo_default) as been create to allow container communication via:
# docker network create -d bridge --subnet 172.25.0.0/16 sidecarpostgresdemo_default
# docker run -d -p 5432:5432 -p 8080:8080 --network=sidecarpostgresdemo_default -e DB_NAME=db_dvdrental -e DB_USER=user_dvdrental -e DB_PASSWD=changeit -e sidecar.port=5432 -e sidecar.appName=POSTGRES-DB_DVDRENTAL -e eureka.client.serviceUrl.defaultZone=http://<registry-host>:8000/eureka/ asimio/db_dvdrental-sidecar:latest
# or via sidecar-postgres-demo/docker-compose.yml
# docker-compose up
