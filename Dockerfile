FROM node:12

RUN apt update && apt -y install vim-tiny psmisc less telnet

WORKDIR /root
COPY package.json package.json
COPY package-lock.json package-lock.json
#COPY . .

RUN npm ci

COPY src src
COPY *.json ./
COPY *.js ./
COPY admin admin
COPY habitat habitat
COPY scripts scripts
COPY test test
COPY Jenkinsfile Jenkinsfile

COPY mycerts/key.pem certs/key.pem
COPY mycerts/cert.pem certs/cert.pem
CMD ["npm","run","local"]

