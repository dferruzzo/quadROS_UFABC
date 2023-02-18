#!/bin/bash
xhost +local:root
docker start quad_ufabc_ros
docker exec -it quad_ufabc_ros bash
xhost -local:root
