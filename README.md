# Nuxt 3 Minimal Starter with multi stage Docker Image

## Build Docker Image

Make sure to install the dependencies:

```bash
docker build --pull --rm -f "nuxt-ssr-docker/Dockerfile" -t nuxtdocker:latest "nuxt-ssr-docker" 

```

## Run the Docker Container

Start the docker container with below command and app can be accessed at http://localhost:8080/

```bash
docker run --rm -d -p 8080:8080/tcp nuxtdocker:latest 
```


Check out the [steps to dockerize nuxt](https://nuxt.com/articles/deploying-nuxt-3-ssr-webapp-with-docker/) for more information.
