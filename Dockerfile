FROM nginx:1.21 AS base
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/
#COPY --from=build /app/dist/* /usr/share/nginx/html/
EXPOSE 80

FROM openjdk:19 AS fetch
RUN apt-get update && apt-get install -y unzip
RUN curl -o app.zip -L "http://192.168.222.133:8081/repository/achatfront/achat/1.0.0/-1.0.0.achat.zip"
# Create a directory to unzip the app build
RUN mkdir /app

# Unzip the app build into the /app directory
RUN unzip app.zip -d /app

#RUN unzip app.zip -d /usr/share/nginx/html/

# Use the Nginx image as the final stage
FROM base AS final

# Copy the Angular app build from the fetch stage
COPY --from=fetch /app /usr/share/nginx/html
