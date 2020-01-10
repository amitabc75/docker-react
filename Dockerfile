# First the build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# now the run phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

# no need to add a command for nginx as we need the default
# run command and that will be run automatically.

