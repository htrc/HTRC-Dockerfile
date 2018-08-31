FROM mysql/mysql-server:5.7

MAINTAINER Data to Insight Center <d2i@indiana.edu>

RUN chmod 644 /var/log/mysqld.log

# Set time zone to ET
ENV TZ=America/Indianapolis
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

