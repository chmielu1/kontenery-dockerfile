From mysql:5.7

LABEL description="This is docker container which deploy database for ehour"

MAINTAINER Mateusz Chmielewski 

ENV MYSQL_ROOT_PASSWORD=qwerty

COPY ./src/ /docker-entrypoint-initdb.d/
