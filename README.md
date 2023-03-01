# keycloak-theme



## Getting started

1. In your keycloak server go to folder ```/home/keycloak```.

2. Clone the repository and rename the main folder from **keycloak-theme** to **themes**.

3. Edit file ```docker-compose.yml``` adding the following lines.

```
volumes:
        - ./themes/demo:/opt/jboss/keycloak/themes/demo
```

4. In order for the changes to apply stop and reiniciate the container.
```
docker-compose down
docker-compose up -d
```
