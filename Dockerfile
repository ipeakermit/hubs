FROM node:12

RUN apt update && apt -y install vim-tiny psmisc less telnet

WORKDIR /root
COPY package.json package.json
COPY package-lock.json package-lock.json
#COPY . .

RUN npm ci
# takes forever??
#RUN npm install regenerator-runtime

RUN echo force rebuild
COPY src src
COPY *.json ./
COPY *.js ./
COPY admin admin
COPY habitat habitat
COPY scripts scripts
COPY test test
COPY Jenkinsfile Jenkinsfile

#COPY mycerts/key.pem certs/key.pem
#COPY mycerts/cert.pem certs/cert.pem
COPY dot-env .env
COPY .babelrc .babelrc
#CMD ["npm","run","dev"]
#CMD ["npm","run","local"]

#WORKDIR /root/admin
#RUN npm install

WORKDIR /root
CMD ["npm","run","prod"]