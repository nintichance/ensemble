FROM nginx:1.15.2-alpine

COPY ./build /var/www
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080

ENTRYPOINT ["nginx","-g","daemon off;"]

FROM node:alpine

RUN mkdir /client

WORKDIR /client

COPY . /client

ENV PATH /client/node_modules/.bin:$PATH

COPY package.json /client/package.json
COPY .npmrc /client/.npmrc
COPY .yarnrc /client/.yarnrc

RUN yarn install --silent
RUN yarn add global react-scripts@3.0.1 --silent

CMD ["yarn", "start"]