FROM nginx:1.21 

RUN apt-get update && apt-get install unzip -y && apt-get install curl -y

RUN curl -o app.zip -L "http://192.168.222.133:8081/repository/achatfront/achat/2.5.0/-2.5.0.achat.zip"

RUN unzip -o app.zip -d /usr/share/nginx/html

RUN rm app.zip

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
