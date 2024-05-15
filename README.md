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

## Deploy

**Note:** You will deploy current keycloak-theme branch
**Note:** Ansible is required

1. Clone [Keycloak povisioning](https://git.coopdevs.org/coopdevs/tooling/keycloak-provisioning)

2. Clone [Keycloak inventory](https://git.coopdevs.org/coopdevs/comunitats-energetiques/keycloak-ccee-inventory)

3. Run ansible script inside `keycloak-provisioning` folder `ansible-playbook playbooks/provision.yml  -i ../keycloak-ccee-inventory/inventory/hosts --limit=test -vvv`. This line will deploy it to test environment

If it's you first time, before running ansible script, you will new to install ansible requirements --> `ansible-galaxy install -r requirements.yml`