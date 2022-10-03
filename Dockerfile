FROM caddy:builder AS builder
LABEL org.opencontainers.image.source = "https://github.com/honnip/caddy-cloudflare"

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
