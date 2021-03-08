# README #

Accompanying source code for blog entry at http://tech.asimio.net/2018/02/20/Microservices-Sidecar-pattern-implementation-using-Postgres-Spring-Cloud-Netflix-and-Docker.html

### Usage example:

```bash
docker network create -d bridge --subnet 172.25.0.0/16 sidecarpostgresdemo_default
docker run -idt -p 8000:8000 --network=sidecarpostgresdemo_default -e spring.profiles.active=standalone -e server.port=8000 -e hostName=$HOSTNAME asimio/discovery-server:1.0.73
docker run -d -p 5432:5432 -p 8080:8080 --network=sidecarpostgresdemo_default -e DB_NAME=db_dvdrental -e DB_USER=user_dvdrental -e DB_PASSWD=changeit -e sidecar.port=5432 -e sidecar.appName=POSTGRES-DB_DVDRENTAL -e eureka.client.serviceUrl.defaultZone=http://172.25.0.2:8000/eureka/ asimio/db_dvdrental-sidecar:latest
```

### How to build

- First build Sidecar application at https://bitbucket.org/asimio/sidecar
- Copy the resulting `jar` into `scripts` folder

```bash
docker build -t asimio/db_dvdrental-sidecar:latest .
```

### Who do I talk to? ###

* ootero at asimio dot net
* https://www.linkedin.com/in/ootero