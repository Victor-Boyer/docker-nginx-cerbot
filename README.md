# docker-nginx-certbot

An easy way to upload your wordpress website with Docker, Nginx and Certbot.

This configuration will create automatically a reverse proxy, a sll certification for your domain and a empty wordpress.

## Installation

- Install [docker](https://docs.docker.com/engine/install/).

- Clone this repository

* Go to the following folder

```bash
cd /docker-nginx-certbot/docker
```

- Create the `.env` file from the sample with your values

```bash
mv .env.sample .env
```

## Custom domain name

```bash
cd /docker-nginx-certbot/docker/nginx-conf
```

**1. default.conf**

You have to change :

- Line 5

```bash
...
server_name example.com www.example.com;
...
```

**2. ssl-default.conf**

You have to change :

- Line 5

```bash
...
server_name example.com www.example.com;
...
```

- Line 20

```bash
...
server_name example.com www.example.com;
...
```

- Line 28 - 29

```bash
...
ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;
...
```

## Usage

Note : For staging application, add `--staging` in ```docker-nginx-cerbot/docker/script``` 

Launch docker

```bash
docker-compose up -d
```

Note : You surely must have the root permissions to start docker.

```bash
sudo docker-compose up -d
```

If docker-compose don't work, try

```bash
docker compose up -d
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[Apache-2.0](https://choosealicense.com/licenses/apache-2.0/)
