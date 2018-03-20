FROM nginx

MAINTAINER Data to Insight Center <d2i@indiana.edu>

RUN groupadd tls
RUN useradd -M -s /bin/nologin -g tls -d /opt/tls -u 1488170 tls

RUN touch /var/run/nginx.pid && \
  chown -R tls:tls /var/run/nginx.pid && \
  chown -R tls:tls /var/cache/nginx && \
  chown -R tls:tls /etc/nginx && \
  chown -R tls:tls /var/log/nginx

USER tls

RUN mkdir -p /etc/nginx/ssl
