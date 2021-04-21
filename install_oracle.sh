#!/bin/bash -e

echo "Instalando JDBC Oracle..."
mkdir ${ORACLE_HOME}/lib
cd ${ORACLE_HOME}/lib
curl -L https://download.oracle.com/otn-pub/otn_software/jdbc/211/ojdbc8-full.tar.gz | tar zx --strip-components 1
echo "JDBC Oracle instalado!"

echo "Inserindo ojdbc8.jar no Jboss..."
mkdir -p /opt/jboss/keycloak/modules/system/layers/base/com/oracle/jdbc/main/driver/
cp ${ORACLE_HOME}/lib/ojdbc8.jar /opt/jboss/keycloak/modules/system/layers/base/com/oracle/jdbc/main/driver/ojdbc.jar
echo "Feito!"
