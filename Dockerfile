FROM node:latest
RUN mkdir -p /data/app/sampleapp
COPY . /data/app/sampleapp
WORKDIR /data/app/sampleapp
RUN pwd && \
    rm package-lock.json && \
    ls && \
	npm init -y && \
	npm install dotenv && \
    npm install && \
	npm test
EXPOSE 3000
CMD node index.js
