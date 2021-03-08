### Usage example:

```bash
docker run -d -e DB_NAME=db_dvdrental -e DB_USER=user_dvdrental -e DB_PASSWD=changeit asimio/postgres
```

### Extending it:
```bash
FROM asimio/postgres

RUN mkdir -p /docker-entrypoint-initdb.d
ADD sql/dvdrental.tar /docker-entrypoint-initdb.d/
```

### Who do I talk to? ###

* ootero at asimio dot net
* https://www.linkedin.com/in/ootero