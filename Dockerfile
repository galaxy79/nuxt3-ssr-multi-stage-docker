# Build the first stage with alpine node image and name as build
FROM node:18-alpine3.17 as build

# update and install latest dependencies
RUN apk update && apk upgrade


# set work dir as app
WORKDIR /app
# copy the nuxt project content
COPY . ./
# install all the project npm dependencies
RUN npm install

# build the nuxt project to generate the artifacts in .output directory
RUN npx nuxt build

# we are using multi stage build process to keep the image size as small as possible
FROM node:18-alpine3.17
# update and install latest dependencies
RUN apk update && apk upgrade
# set work dir as app
WORKDIR /app
# copy the output directory to the /app directory from build stage
COPY --from=build /app/.output ./
# expose 8080 on container
EXPOSE 8080

# set app host and port . In nuxt 3 this is based on nitor and you can read
#more on this https://nitro.unjs.io/deploy/node#environment-variables
ENV HOST=0.0.0.0

# set app port
ENV PORT=8080
# set node env as prod
ENV NODE_ENV=production
# start the app
CMD HOSTNAME="myhost" node /app/server/index.mjs
# CMD [ "node", "/app/server/index.mjs" ]