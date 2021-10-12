#!/bin/bash

#REDES
rede_a='rede-a'
rede_b='rede-b'

#CONAINERS
container_a1='app-a'
container_a2='mysql-a'
container_a3='phpmyadmin-a'
container_b1='app-b'
container_b2='mysql-b'
container_b3='phpmyadmin-b'

echo 'Conectando conainters A com a rede B'
sudo docker network connect $rede_b $container_a1
sudo docker network connect $rede_b $container_a2
sudo docker network connect $rede_b $container_a3
echo 'Conectando conainters B com a rede a'
sudo docker network connect $rede_a $container_b1
sudo docker network connect $rede_a $container_b2
sudo docker network connect $rede_a $container_b3
