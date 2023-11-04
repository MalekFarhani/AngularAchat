FROM nginx:1.21

#COPY --from=build /app/dist/* /usr/share/nginx/html/
RUN apt-get update && apt-get install -y unzip
RUN curl -o app.zip -L "http://192.168.222.133:8081/repository/achatfront/achat/1.0.0/-1.0.0.achat.zip"

RUN unzip app.zip -d /usr/share/nginx/html/
RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
