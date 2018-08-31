FROM nginx

MAINTAINER Data to Insight Center <d2i@indiana.edu>

#RUN groupadd tls
#set htrcprod uid to user in the container
#RUN useradd -M -s /bin/nologin -g tls -d /opt/tls -u 1488170 tls

# Set time zone to ET
ENV TZ=America/Indianapolis
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#RUN touch /var/run/nginx.pid && \
#  chown -R tls:tls /var/run/nginx.pid && \
#  chown -R tls:tls /var/cache/nginx && \
#  chown -R tls:tls /etc/nginx && \
#  chown -R tls:tls /var/log/nginx

#USER tls

RUN mkdir -p /etc/nginx/ssl

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./conf.d /etc/nginx/conf.d
COPY ./ssl /etc/nginx/ssl
