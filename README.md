# keycloak-oracle-wallet
Keycloack custom container with script to work with Oracle Cloud free databases.

-Download Oracle Wallet from Oracle Cloud

-Unzip wallet file in ./wallet

-Add wallet password(download defined) in ./wallet/ojdbc.properties {javax.net.ssl.trustStorePassword and javax.net.ssl.keyStorePassword}

-Build container. Ex. podman built -t keycloak:latest .

-Run container. Ex. podman run -d -p 8080:8080 -p 8443:8443 -v "$(pwd)/wallet:/opt/oracle/wallet:ro" -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin -e DB_USER=USER -e DB_PASSWORD=PASSWORD localhost/keycloak

