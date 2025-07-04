FROM node:20.17.0 AS build

WORKDIR /usr/src/app

COPY package.json yarn.lock ./

RUN yarn

COPY . .

RUN yarn run build
RUN yarn install --production --frozen-lockfile && yarn cache clean

FROM node:20.17.0-alpine3.20

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/package.json ./package.json
COPY --from=build /usr/src/app/yarn.lock ./yarn.lock
COPY --from=build /usr/src/app/dist ./dist
COPY --from=build /usr/src/app/node_modules ./node_modules

EXPOSE 3000

CMD ["npm", "run", "start:prod"]
