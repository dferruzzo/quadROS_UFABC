#!/bin/bash
#
# Data: 02/04/2023
# Autor: Diego Ferruzzo
#
# Bash script para INICIAR um container existente 
# com acesso ao servido X11 no Linux. 
# Abre um terminal bash nele.
#
# Recebe um parâmetros: O nome do container
#
# start_container_args NOME_DO_CONTAINER
# -----------------------------------------------------------------------

xhost +local:`docker inspect --format='{{ .Config.Hostname }}' $1`
echo
echo "Inicia container $1"
echo "Inicia terminal bash em $1"
echo
docker start $1
docker exec -it $1 bash
