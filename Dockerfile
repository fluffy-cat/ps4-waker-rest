FROM node:10.16.0-alpine

COPY build/qemu-arm-static /usr/bin

WORKDIR /ps4waker-rest
COPY REST-wrapper/* ./

RUN npm config set unsafe-perm true && \
    npm install -g . && \
    npm config set unsafe-perm false && \
    chmod +x run.sh

VOLUME /waker/data
EXPOSE 3031
CMD /ps4waker-rest/run.sh