FROM arm32v7/node:10.15.3-jessie

COPY REST-wrapper /ps4waker-rest

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
