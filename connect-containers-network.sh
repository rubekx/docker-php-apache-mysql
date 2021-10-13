#!/bin/bash

#variavel TRUE conectar os containers
conectar=false
#variavel FALSE desconectar os containers

#REDES
rede_a='sgat_final_project_rede'
rede_b='registro-presenca_rede'

#CONAINERS
container_a1='sgat-server-app'
container_a2='sgat-phpmyadmin'
container_a3='sgat-mysql'

container_b1='registro-presenca-app'
container_b2='registro-presenca-phpmyadmin'
container_b3='registro-presenca-mysql'

if $conectar ; then
    acao='connect'
    echo 'Conectando conainters A com a rede B'
    sudo docker network $acao $rede_b $container_a1
    sudo docker network $acao $rede_b $container_a2
    sudo docker network $acao $rede_b $container_a3
    echo 'Conectando conainters B com a rede a'
    sudo docker network $acao $rede_a $container_b1
    sudo docker network $acao $rede_a $container_b2
    sudo docker network $acao $rede_a $container_b3
else
    acao='disconnect'
    echo 'Desconectando conainters A com a rede B'
    sudo docker network $acao $rede_b $container_a1
    sudo docker network $acao $rede_b $container_a2
    sudo docker network $acao $rede_b $container_a3
    echo 'Desconectando conainters B com a rede a'
    sudo docker network $acao $rede_a $container_b1
    sudo docker network $acao $rede_a $container_b2
    sudo docker network $acao $rede_a $container_b3
fi
