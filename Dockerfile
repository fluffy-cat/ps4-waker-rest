FROM node:10.16.0-alpine

COPY REST-wrapper /ps4waker-rest
COPY qemu-arm-static /usr/bin

RUN cd ps4waker-rest \
          && npm config set unsafe-perm true \
          && npm install -g . \
          && npm config set unsafe-perm false \
          && mkdir -p /waker/data

COPY run.sh /

RUN chmod a+x /run.sh

VOLUME ["/waker/data"]

EXPOSE 3031

CMD [ "/run.sh" ]
