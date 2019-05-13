#!/bin/bash

#get user and group id and give it to docker to build with display permission
uid=$(id -u)
gid=$(id -g)

#build image with tag ark
docker build -t ark . --build-arg user_id=$uid --build-arg group_id=$gid