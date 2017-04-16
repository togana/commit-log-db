FROM mysql:5.6.35
MAINTAINER togana "o.togana@gmail.com"

ENV MYSQL_DATABASE=commit-log

COPY commit-log.sql.gz /docker-entrypoint-initdb.d
