FROM mysql
COPY ./script/GuanaFarm.sql /docker-entrypoint-initdb.d/
EXPOSE 3306