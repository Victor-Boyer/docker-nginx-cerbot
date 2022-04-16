FROM nginx:stable-alpine

COPY ./script/entrypoint.sh ./
COPY ./nginx-conf/default.conf ./
COPY ./nginx-conf/ssl-default.conf ./

COPY ./cron ./

RUN chmod +x ./entrypoint.sh  
 
CMD nginx -g 'daemon on;' ; ./entrypoint.sh 
