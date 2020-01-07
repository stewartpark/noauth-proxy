# noauth-proxy

noauth-proxy lets a local process use an authenticated proxy without credentials. Do not use this on production.

```
docker run -it \
    -e PROXY_HOST=... \
    -e PROXY_PORT=... \
    -e PROXY_USERNAME=... \
    -e PROXY_PASSWORD=... \
    -p 8080:8080
    stewartpark/noauth-proxy 
```
