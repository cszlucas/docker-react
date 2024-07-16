FROM node:alpine as builder
#tag name "builder phase"

WORKDIR '/app'
COPY package.json .
RUN npm install
#can copy everything since no longer doing live updates in production like we did with docker-compose
COPY . .
#create build folder directory with apps code
RUN npm run build

FROM nginx
#want to copy the build folder directory, in the builder phase
#copying the thing to /usr/share/nginx/html inside the nginx container. Can find this in docker hub nginx image.
#everything else not in builder directory is lost, including alpine image
COPY --from=builder /app/build /usr/share/nginx/html

#the default command of nginx container starts nginx, so we don't have to specify it
#docker run -p "8080:80" <image id> //80 is the default port nginx uses
