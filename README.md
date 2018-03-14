# noc-jenkins
Repository containing NOC Gridu path tasks

# Prerequisites
docker 1.13+
docker-compoose

# Usage

To build noc-docker image:
```
docker-compose build
```
To run noc-docker container:
```
docker-compose up -d
```
To remove noc-docker container:
```
docker-compose down
```
## Accessing jenkins
Open http://localhost:8080/ and login with following credentials:

* Username: `admin`
* Password: `admin`
