FROM node:19-alpine

RUN apk add --no-cache npm wget && \
	npm i -g http-server ghost-static-site-generator

