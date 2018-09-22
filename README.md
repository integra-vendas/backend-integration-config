# backend-integration-config

## .env
```
## branches for integration

LOGIN=dev
API_GATEWAY=dev
PRODUCT=dev
ORDER=dev
```

This is the environment file that defines what branches will be pulled from the repository and built.

## Running

```
make
```

## Entering on container

```shell
sudo docker ps ## to see the running containers

sudo docker exec -ti api-gateway bash
```

## Testing connectivity

Inside the container run
```python
pip install requests
python

>>> import requests
>>> requests.get('http://products-microservice:8002/products') 
```