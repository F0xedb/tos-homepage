<h1 align="center">Welcome to tos-homepage 👋</h1>
<p>
</p>

> Website for tos linux with blog

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


## Author

👤 **Tom Meyers**

* Github: [@F0xedb](https://github.com/F0xedb)

## Show your support

Give a ⭐️ if this project helped you!

---

