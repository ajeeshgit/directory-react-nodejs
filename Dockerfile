FROM nginx
RUN \ 
     apt-get update && \
     apt-get install -y npm && \
     apt-get install -y nodejs && \
     apt-get install -y git && \	
     echo "\ndaemon off;" >> /etc/nginx/nginx.conf 
COPY default /etc/nginx/sites-available/default
COPY default /etc/nginx/conf.d/default.conf
COPY nginx.crt /etc/nginx/certs/nginx.crt
COPY nginx.key /etc/nginx/certs/nginx.key
# Define working directory.
WORKDIR /etc/nginx
# Define default command.
CMD ["nginx"]
EXPOSE 443
COPY . /empdirectory
RUN cd /empdirectory && npm install
CMD ["nodejs /empdirectory/server.js"}

