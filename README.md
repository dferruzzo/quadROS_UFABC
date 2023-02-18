# QuadROS UFABC
Esse repositório é um fork do [mateusribs](https://github.com/mateusribs/quadROS_UFABC), que desenvolveu um sistema de "Position and Attitude Estimation of a Quadrotor Using Computer Vision", todos os créditos são dele. Aqui utilizamos o entorno de simulação ROS-Gazebo que ele implementou como base.

# Instalação
As instruções aqui mostradas são para sistemas operacionais baseados em distros Linux. 

## Docker 
Precisa instalar o Docker engine (não o Docker Desktop), veja o tutorial aqui: [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/). Também precisa o git
```
$ sudo apt-get install git-all
```

1. Clone esse repositório
```
git clone https://github.com/dferruzzo/quadROS_UFABC.git
```
Entre no diretório `cd quadROS_UFABC/`

2. Crie a Docker imagem a partir do Dockerfile:

```
$ docker build . -t quad_ufabc:latest
$ docker images
```
3. Rode o shell script `create_container.sh` para criar o Docker container `quad_ufabc_ros`:

```
$ ./create_container.sh
```
O container `quad_ufabc_ros` com acesso ao DISPLAY é criado e iniciado.

4. Para iniciar o container novamente
```
$ ./start_container.sh
```
## VSCode Docker Plugin
Para trabalhar com o conteúdo do container utilizo o VSCode com o [plugin Docker](https://github.com/microsoft/vscode-docker), que permite acessar o conteúdo do container e trabalhar nele.
