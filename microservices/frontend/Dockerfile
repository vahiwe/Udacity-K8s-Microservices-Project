# Use NodeJS base image
FROM node:13 as build

# Add Arguments
ARG POSTGRES_USERNAME_ARG
ARG POSTGRES_PASSWORD_ARG
ARG POSTGRES_HOST_ARG
ARG POSTGRES_DB_ARG
ARG AWS_BUCKET_ARG
ARG AWS_REGION_ARG
ARG AWS_PROFILE_ARG
ARG JWT_SECRET_ARG
ARG URL_ARG

# Set Environment Variable
ENV POSTGRES_USERNAME=${POSTGRES_USERNAME_ARG}
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD_ARG}
ENV POSTGRES_HOST=${POSTGRES_HOST_ARG}
ENV POSTGRES_DB=${POSTGRES_DB_ARG}
ENV AWS_BUCKET=${AWS_BUCKET_ARG}
ENV AWS_REGION=${AWS_REGION_ARG}
ENV AWS_PROFILE=${AWS_PROFILE_ARG}
ENV JWT_SECRET=${JWT_SECRET_ARG}
ENV URL=${URL_ARG}

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
