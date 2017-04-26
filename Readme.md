# docker-web2canvas

Docker container for [web2canvas][1]

> The Web2Canvas is a visual guide to building your business model.

This package runs Web2Canvas in the port 8000

## Install dependencies

  - [Docker][2]

To install docker in a Linux flavor [follow this instructions][3].

To install docker in other operating systems check [docker online documentation][4]

## Usage

To run container use the command below:
```
$ docker run --name web2canvas -p 80:80 -d filhocf/web2canvas
```

The -p option of docker accepts two port numbers. The first one is the host (your machine) port, the second is the container (docker machine) port. So if you are running a webserver in your machine (host) on port 80 you can change the host port to something different, for example:
```
$ docker run --name web2canvas -p 81:80 -d filhocf/web2canvas
```

Both commands are fowarding the host port number 80 or 81 to the port 80 of the nginx server in the container (docker machine).

## More Info

About Web2Canvas: [www.web2canvas.x4start.com][1]

To help improve this container [docker-web2canvas][5]


[1]:http://www.web2canvas.x4start.com/
[2]:http://www.docker.com
[3]:http://docs.docker.com/engine/installation/linux/
[4]:http://docs.docker.com
[5]:http://github.com/filhocf/docker-web2canvas
