FROM node:12
COPY . .
RUN npm ci
CMD ["npm","run","local"]
