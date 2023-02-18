#!/bin/bash
#
# Data: 02/04/2023
# Autor: Diego Ferruzzo
#
# Bash script para crear um container com acesso ao servido X11 no Linux. 
# Uma vez criado o container encerra ele.
#
# Recebe dois parâmetros:
# 1. O nome do container
# 2. O nome da imagem na forma REPOSITORY:TAG
#
# create_container_args NOME_DO_CONTAINER REPOSITORY:TAG
# -----------------------------------------------------------------------

if [[ $# = 2 ]]; then

    echo
    # mostra os containers antes
    docker ps -a
    echo
    echo "Crear container $1"
    echo "a partir da imagem $2"

    xhost +local:root

    XAUTH=/tmp/.docker.xauth

    docker run -it \
            --name=$1 \
            --env="DISPLAY=$DISPLAY" \
            --env="QT_X11_NO_MITSHM=1" \
            --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
            --env="XAUTHORITY=$XAUTH" \
            --volume="$XAUTH:$XAUTH" \
            --net=host \
            --privileged \
            --device /dev/snd \
            $2 \
            bash
    echo
    echo "Container creado"
    echo "Container encerrado"
    echo
    xhost -local:root
    # mostra o novo container criado
    docker ps -a
    echo
else
    echo 
    echo "Numero de parâmetros incorreto"
    echo "Utilize: ./create_container_args NOME_DO_CONTAINER REPOSITORY:TAG" 
    echo   
fi
