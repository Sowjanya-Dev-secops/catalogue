FROM node:20.19.6-alpine3.21 AS build
WORKDIR /opt/server
#current directory
COPY package.json . 
COPY *.js .
RUN npm install

FROM node:20.19.6-alpine3.21 
WORKDIR /opt/server
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop && \
    chown roboshop:roboshop /opt/server
EXPOSE 8080
LABEL com.project="roboshop" \
      component="catalogue" \
      created_by="sowjanya"
ENV MONGO="true"\
    MONGO_URL="mongodb://mongodb:27017/catalogue"
COPY --from=build --chown=roboshop:roboshop /opt/server /opt/server
USER roboshop
CMD ["server.js"]
ENTRYPOINT ["node"]



# FROM node:20
# WORKDIR /opt/server
# #current directory
# COPY package.json . 
# COPY *.js .
# RUN npm install
# ENV MONGO="true"\
#     MONGO_URL="mongodb://mongodb:27017/catalogue"
# CMD ["node","server.js"]