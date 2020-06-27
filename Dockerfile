FROM node:14.4.0@sha256:3465907b06c3ace503458622dcda723586825baf39c3d5bd956c752552cb7b80 as builder

WORKDIR /app
COPY package.json .
RUN npm install --only-production


FROM node:14.4.0@sha256:3465907b06c3ace503458622dcda723586825baf39c3d5bd956c752552cb7b80 as release

COPY --from=builder /app/node_modules ./node_modules
COPY app.js .
ENTRYPOINT [ "node" ]
CMD [ "app.js" ]
