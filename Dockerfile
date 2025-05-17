# syntax=docker/dockerfile:1
# check=error=true

FROM ghcr.io/tcely/docker-magic-wormhole-base:nightly AS magic-wormhole-transit-relay

USER root
RUN set -eux; \
    install -v -d -o app -g app -m 01777 /data

USER app
RUN set -eu; \
    . "${HOME}/bin/activate" ; set -x ; \
    pip install --upgrade pip && \
    pip install magic-wormhole-transit-relay

EXPOSE 4001/tcp
VOLUME ["/data"]
ENTRYPOINT ["/app/bin/entrypoint.sh", "twist", "--log-format=text", "transitrelay"]
CMD ["--usage-db=/data/usage.sqlite"]

