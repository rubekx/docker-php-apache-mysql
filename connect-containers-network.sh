#!/bin/bash

#REDES
rede_a='A_rede'
rede_b='B_rede'

#CONAINERS
container_a1='B-app'
container_a2='B-mysql'
container_a3='B-phpmyA'

container_b1='A-app'
container_b2='A-mysql'
container_b3='A-phpmyA'

echo 'Conectando conainters A com a rede B'
sudo docker network connect $rede_b $container_a1
sudo docker network connect $rede_b $container_a2
sudo docker network connect $rede_b $container_a3
echo 'Conectando conainters B com a rede a'
sudo docker network connect $rede_a $container_b1
sudo docker network connect $rede_a $container_b2
sudo docker network connect $rede_a $container_b3
