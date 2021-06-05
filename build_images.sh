#!/bin/bash

docker build -t vahiwe/udagram-api-feeds \
--build-arg POSTGRES_USERNAME_ARG=${POSTGRES_USERNAME} \
--build-arg POSTGRES_PASSWORD_ARG=${POSTGRES_PASSWORD} \
--build-arg POSTGRES_HOST_ARG=${POSTGRES_HOST} \
--build-arg POSTGRES_DB_ARG=${POSTGRES_DB} \
--build-arg JWT_SECRET_ARG=${JWT_SECRET} \
--build-arg AWS_BUCKET_ARG=${AWS_BUCKET} \
--build-arg AWS_REGION_ARG=${AWS_REGION} \
--build-arg AWS_PROFILE_ARG=${AWS_PROFILE} \
--build-arg AWS_ACCESS_KEY_ID_ARG=${AWS_ACCESS_KEY_ID} \
--build-arg AWS_SECRET_ACCESS_KEY_ARG=${AWS_SECRET_ACCESS_KEY} \
--build-arg URL_ARG=${URL} -f ./microservices/api/feeds/Dockerfile ./microservices/api/feeds/

docker build -t vahiwe/udagram-api-users \
--build-arg POSTGRES_USERNAME_ARG=${POSTGRES_USERNAME} \
--build-arg POSTGRES_PASSWORD_ARG=${POSTGRES_PASSWORD} \
--build-arg POSTGRES_HOST_ARG=${POSTGRES_HOST} \
--build-arg POSTGRES_DB_ARG=${POSTGRES_DB} \
--build-arg JWT_SECRET_ARG=${JWT_SECRET} \
--build-arg AWS_BUCKET_ARG=${AWS_BUCKET} \
--build-arg AWS_REGION_ARG=${AWS_REGION} \
--build-arg AWS_PROFILE_ARG=${AWS_PROFILE} \
--build-arg AWS_ACCESS_KEY_ID_ARG=${AWS_ACCESS_KEY_ID} \
--build-arg AWS_SECRET_ACCESS_KEY_ARG=${AWS_SECRET_ACCESS_KEY} \
--build-arg URL_ARG=${URL} -f ./microservices/api/users/Dockerfile ./microservices/api/users/

docker build -t vahiwe/udagram-frontend -f ./microservices/frontend/Dockerfile ./microservices/frontend/

docker build -t vahiwe/simple-reverse-proxy -f ./microservices/reverse-proxy/Dockerfile ./microservices/reverse-proxy/