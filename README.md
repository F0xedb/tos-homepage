<h1 align="center">Welcome to tos-homepage 👋</h1>
<p>
</p>

> Website for tos linux using hugo

[![Build Status](https://jenkins.pbfp.xyz/buildStatus/icon?job=Hugo)](https://jenkins.pbfp.xyz/job/Hugo/)
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2FF0xedb%2Ftos-homepage.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2FF0xedb%2Ftos-homepage?ref=badge_shield)

### 🏠 [Homepage](https://tos.pbfp.xyz)

## explanation

Deploy this repo on your server. There are 2 containers

* web-server
* go builder

The web-server hosts our static website

The go builder uses hugo to build the current version of the website.

## Install
Make sure docker and docker-compose are installed
`docker --version && docker-compose --version`

```sh
# Launch without traefik
docker-compose up docker-compose-notraefik.yml
```

```sh
# Launch with traefik
docker-compose up
```

## Usage

### Start the containers

```sh
docker-compose up
```

### rebuild the output

```sh
docker-compose restart hugo
```
Don't forget to use the jenkins pipeline
Your jenkins build will need access to docker.
Alternatively you can have hugo installed and discard docker 

## Author

👤 **Tom Meyers**

* Github: [@F0xedb](https://github.com/F0xedb)

## Show your support

Give a ⭐️ if this project helped you!

---



## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2FF0xedb%2Ftos-homepage.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2FF0xedb%2Ftos-homepage?ref=badge_large)