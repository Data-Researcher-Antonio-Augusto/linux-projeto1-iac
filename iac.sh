#!/bin/bash

# Definição de grupos e usuários
GRUPOS=("GRP_ADM" "GRP_VEN" "GRP_SEC")
USUARIOS_ADM=("carlos" "maria" "joao")
USUARIOS_VEN=("debora" "sebastiana" "roberto")
USUARIOS_SEC=("josefina" "amanda" "rogerio")

# Criando grupos
echo "Criando grupos..."
for GRUPO in "${GRUPOS[@]}"; do
    groupadd $GRUPO
done

# Criando usuários e adicionando aos grupos
echo "Criando usuários..."
for USUARIO in "${USUARIOS_ADM[@]}"; do
    useradd -m -s /bin/bash -G GRP_ADM $USUARIO
    echo "$USUARIO:senha123" | chpasswd
done

for USUARIO in "${USUARIOS_VEN[@]}"; do
    useradd -m -s /bin/bash -G GRP_VEN $USUARIO
    echo "$USUARIO:senha123" | chpasswd
done

for USUARIO in "${USUARIOS_SEC[@]}"; do
    useradd -m -s /bin/bash -G GRP_SEC $USUARIO
    echo "$USUARIO:senha123" | chpasswd
done

# Criando diretórios
echo "Criando diretórios..."
mkdir -p /publico
mkdir -p /adm /ven /sec

# Definindo permissões dos diretórios
echo "Definindo permissões..."
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm /ven /sec
chmod 777 /publico

echo "Configuração concluída!"
