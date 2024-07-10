FROM node:20-bookworm AS dependencies
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install

FROM node:20-bookworm AS build
WORKDIR /app
COPY --from=dependencies /app/node_modules ./node_modules
COPY . .
RUN npm run build

FROM node:20-alpine
WORKDIR /app
COPY --from=dependencies /app/node_modules ./node_modules
COPY --from=build /app/dist ./
CMD [ "node", "app.mjs" ]