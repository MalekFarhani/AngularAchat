FROM nginx:1.21 

RUN apt-get update && apt-get install unzip -y && apt-get install curl -y

# Download app.zip
RUN curl -o app.zip -L "http://192.168.222.133:8081/repository/achatfront/achatconfig/front-build/1.0.0/front-build-1.0.0.achat.zip"

# Extract app.zip
RUN unzip -o app.zip -d /usr/share/nginx/html

# Clean up app.zip
RUN rm app.zip

# Download nginx.conf.zip
RUN curl -o nginx.conf -L "http://192.168.222.133:8081/repository/achatfront/achatconfig/nginx-config/1.0.0/nginx-config-1.0.0"

# Extract nginx.conf.zip
RUN mv nginx.conf /etc/nginx/conf.d/nginx.conf

RUN rm /etc/nginx/conf.d/default.conf

RUN apt-get remove -y unzip curl && apt-get autoremove -y

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
