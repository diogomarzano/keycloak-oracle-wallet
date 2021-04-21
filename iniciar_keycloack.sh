!#/bin/bash
podman run -d -p 8080:8080 -p 8443:8443 -v "$(pwd)/wallet:/opt/oracle/wallet:ro" -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin -e DB_PASSWORD=PASSWORD localhost/keycloak
