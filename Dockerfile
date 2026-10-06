FROM node:22-alpine
RUN apk add --no-cache unzip
WORKDIR /app
COPY vaultdrop-app.b64 /tmp/vaultdrop-app.b64
RUN base64 -d /tmp/vaultdrop-app.b64 > /tmp/vaultdrop.zip \
 && unzip -q /tmp/vaultdrop.zip -d /tmp/vaultdrop \
 && cp -R /tmp/vaultdrop/vaultdrop_final/. /app/ \
 && rm -rf /tmp/vaultdrop*
EXPOSE 4173
CMD ["node","server.js"]
