#!/bin/bash

#REDES
rede_a='abtms-admin_rede'
rede_b='abtms-associado_rede'

#CONAINERS
container_a1='associado-app'
container_a2='associado-mysql'
container_a3='associado-phpmyadmin'
container_b1='admin-app'
container_b2='admin-mysql'
container_b3='admin-phpmyadmin'

echo 'Conectando conainters A com a rede B'
sudo docker network connect $rede_b $container_a1
sudo docker network connect $rede_b $container_a2
sudo docker network connect $rede_b $container_a3
echo 'Conectando conainters B com a rede a'
sudo docker network connect $rede_a $container_b1
sudo docker network connect $rede_a $container_b2
sudo docker network connect $rede_a $container_b3
