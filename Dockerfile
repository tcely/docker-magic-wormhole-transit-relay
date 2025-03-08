# syntax=docker/dockerfile:1
# check=error=true

FROM ghcr.io/tcely/docker-magic-wormhole-base AS magic-wormhole-transit-relay

RUN set -eu; \
    . "${HOME}/bin/activate" ; set -x ; \
    pip install --upgrade pip && \
    pip install magic-wormhole-transit-relay

ENTRYPOINT ["/app/bin/entrypoint.sh", "twist", "transitrelay"]
