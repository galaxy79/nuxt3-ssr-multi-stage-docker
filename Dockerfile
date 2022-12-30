# ARG USERNAME=nuxtuser
# ARG USER_UID=1000
# ARG USER_GID=$USER_UID
# Build the first stage with alpine node image and name as build
FROM node:18-alpine3.17 as build

# update and install latest dependencies
RUN apk update && apk upgrade
# RUN apk add --no-cache shadow
RUN adduser -D nuxtuser
USER nuxtuser
# # Create the user
# RUN addgroup -g 1001 nuxtuser \
#     && adduser -uid 1001 -gid 1001 -m nuxtuser
# # Set the user
# USER $USERNAME    
# set work dir as app
WORKDIR /app
# copy the nuxt project content
COPY --chown=nuxtuser:nuxtuser . /app
# COPY . ./
# set node env as prod
# ENV NODE_ENV=production
# install all the project npm dependencies

RUN npm install
#RUN npm ci --only=production
# build the nuxt project to generate the artifacts in .output directory
RUN npx nuxt build

# we are using multi stage build process to keep the image size as small as possible
FROM node:18-alpine3.17
# update and install latest dependencies, add dumb-init package
RUN apk update && apk upgrade && apk add dumb-init
# add and set non root user
RUN adduser -D nuxtuser 
USER nuxtuser

# set work dir as app
WORKDIR /app
# copy the output directory to the /app directory from 
# build stage with proper permissions for user nuxt user
COPY --chown=nuxtuser:nuxtuser --from=build /app/.output ./
# expose 8080 on container
EXPOSE 8080

# set app host and port . In nuxt 3 this is based on nitor and you can read
#more on this https://nitro.unjs.io/deploy/node#environment-variables
ENV HOST=0.0.0.0

# set app port
ENV PORT=8080
# set node env as prod
ENV NODE_ENV=production
# start the app with dumb init to spawn the Node.js runtime process
# with signal support
CMD ["dumb-init","node","/app/server/index.mjs"]
