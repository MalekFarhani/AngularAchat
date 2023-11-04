# Use an official Nginx base image as the base stage
FROM nginx:1.21 
WORKDIR /app
# Remove the default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy your custom Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/

# Expose port 80 for web traffic
EXPOSE 80

# Install the unzip utility (using apk in an Alpine-based image)
RUN apt-get update && apt-get install unzip && apt-get install curl

# Create a directory to store the app build files


# Download the Angular app build from Nexus
RUN curl -o app.zip -L "http://192.168.222.133:8081/repository/achatfront/achat/1.5.0/-1.5.0.achat.zip"

# Unzip the app build into the /app directory
RUN unzip app.zip -d /usr/share/nginx/html

RUN rm app.zip
RUN ls -l

# Use the Nginx image as the final stage

# Copy the Angular app build from the fetch stage


CMD ["nginx", "-g", "daemon off;"]
