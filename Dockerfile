FROM quay.io/keycloak/keycloak

ENV LAUNCH_JBOSS_IN_BACKGROUND 1
ENV PROXY_ADDRESS_FORWARDING false
ENV JBOSS_HOME /opt/jboss/keycloak
ENV LANG en_US.UTF-8

ENV DB_VENDOR="oracle"
ENV ORACLE_HOME="/opt/oracle"
ENV JAVA_OPTS_APPEND="-cp ${ORACLE_HOME}/lib/ojdbc8.jar:${ORACLE_HOME}/lib/oraclepki.jar:${ORACLE_HOME}/lib/osdt_cert.jar:${ORACLE_HOME}/lib/osdt_core.jar:${ORACLE_HOME}/lib/oraclepki.jar -Doracle.net.tns_admin=${ORACLE_HOME}/wallet"

USER root

RUN microdnf update -y  && microdnf clean all

#ADD wallet ${ORACLE_HOME}/wallet

#Ponto de montagem para o wallet
RUN mkdir -p ${ORACLE_HOME}/wallet

ADD install_oracle.sh ${ORACLE_HOME}/install_oracle.sh

ADD change-database.cli /opt/jboss/tools/cli/databases/oracle/change-database.cli

RUN sh ${ORACLE_HOME}/install_oracle.sh

RUN rm ${ORACLE_HOME}/install_oracle.sh

USER 1000

EXPOSE 8080
EXPOSE 8443

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]

CMD ["-b", "0.0.0.0"]

#tar zcvf ./keycloak-docker.tar.gz --exclude=".vscode" -C /opt/keycloak/ .
