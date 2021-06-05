# Use NodeJS base image
FROM node:13 as build

# Create app directory
WORKDIR /app

# Install Ionic
RUN npm install -g ionic

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json /app/

# Install dependencies
RUN npm install

# Copy app source
COPY . /app/

# Build Source code
RUN npm run build

# Use Nginx base image
FROM nginx:alpine

# Remove default Nginx files
RUN rm -rf /usr/share/nginx/html/*

# Copy build files from ionic
COPY --from=build /app/www/ /usr/share/nginx/html/
