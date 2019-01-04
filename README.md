## Using
Download Dockerfile

```bash
$git clone https://github.com/xxxxsars/docker-goenv.git
```

Build in host (default go version is 1.11.2)

```bash
$docker build -t goenv:1.11.2
```

Run docker container

```bash
$docker run -d -p <localh port>:<container port> goenv:1.11.2
#example
$docker run -d -p 32782:22 goenv:1.11.2

```

Connect your container 

```bash
$ssh root@localhost -p 32782
```
