FROM node:alpine

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

# generate client build
RUN npm run build

# run stage
FROM nginx
# from specifies the name or index of a build stage
COPY --from=0 /app/build /usr/share/nginx/html
#the default command of nginx starts up nginx