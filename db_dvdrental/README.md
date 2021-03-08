### Usage example:

```bash
docker run -d asimio/db_dvdrental
```
or
```bash
docker run -d -e DB_PASSWD=changeit asimio/db_dvdrental
```
or
```
docker run -d -p 5432:5432 -e DB_NAME=db_dvdrental -e DB_USER=user_dvdrental -e DB_PASSWD=changeit asimio/db_dvdrental:latest
```

### Who do I talk to? ###

* ootero at asimio dot net
* https://www.linkedin.com/in/ootero