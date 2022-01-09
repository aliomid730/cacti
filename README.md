Docker Image with Cacti server using php:7.4-apache docker image as base. Image is using external MariaDB database and it's build on PHP 7.4.

## Database Deployment
We need to run a database before running the cacti monitoring server. You can find the needed files in the [Github repo](https://github.com/aliomid730/cacti).
```
docker run --detach --name db1 --hostname db1 -v "$PWD"/50-server.cnf:/etc/mysql/mariadb.conf.d/50-server.cnf -v "$PWD"/cacti.sql:/cacti.sql \
-v "$PWD"/import.sh:/docker-entrypoint-initdb.d/30-import.sh -v "$PWD"/database.sql:/docker-entrypoint-initdb.d/10-database.sql -p 3306:3306 \
--env MARIADB_USER=cacti --env MARIADB_PASSWORD=changeme --env MARIADB_ROOT_PASSWORD=changeme  mariadb:latest
```

## Cacti Deployment

Cacti monitoring system is listening on port 80.

```
docker run -d --link db1 --name cacti --hostname cacti -p 80:80 hashimi/cacti
```

## Access Cacti Web Interface
To log in into cacti for the first time use credentials `admin:admin`. System will ask you to change those when logged in for the first time.

Access web interface using (http://dockerhost.ip/cacti/)

Follow the on screen instructions.
