# docker-haproxy-ssl
Lean (8MB) HAProxy + SSL termination Docker image, based on `progrium/busybox`.

[![Docker Repository on Quay.io](https://quay.io/repository/pires/docker-haproxy-ssl/status "Docker Repository on Quay.io")](https://quay.io/repository/pires/docker-haproxy-ssl)

## Current software

* HAProxy 1.5.11-patch02

## Pre-requisites

* Docker 1.5.0+ (tested with boot2docker)

## Run

### Certificate

The configured haproxy expects a file haproxy.pem under /etc/haproxy/certs which contains the complete certificate for the server:

* RSA Key
* Domain Certificate
* (optional) Intermediate Certificate (CA chain)

e.g:
```
-----BEGIN RSA PRIVATE KEY-----
MIIEow...
-----END RSA PRIVATE KEY-----
-----BEGIN CERTIFICATE-----
MIIFVTC...
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
MIIGCDCC...
-----END CERTIFICATE-----
```

### Webserver

The haproxy forwards all requests to the url webserver:80. The easiest way ist to link the associated container with an alias name 
webserver.

### Sample

```
docker run -d -p 80:80 -p 443:443 -v /path/to/your:/etc/haproxy/certs --link=yourhost:webserver rocketbaseio/docker-haproxy-ssl:latest
```