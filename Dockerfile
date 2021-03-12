FROM tiangolo/uwsgi-nginx-flask:python3.6

ENV LISTEN_PORT 8080
EXPOSE 8080

COPY ./app /app

RUN  echo  "Start building on top of tiangolo image ..." \
 &&  cp /app/conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf \
 &&  cp /app/conf/uwsgi.ini        /app/uwsgi.ini    \
 &&  touch /etc/nginx/conf.d/nginx.conf \
 &&  chmod -R g+rwx /var/log/supervisor \
 &&  chmod -R g+rwx /var/cache/nginx /var/run /var/log/nginx  /etc/nginx/
