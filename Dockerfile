FROM kong:1.5.1-alpine

RUN apk add --no-cache git
RUN luarocks install kong-oidc
RUN luarocks install kong-oidc-consumer
RUN luarocks install kong-response-size-limiting
RUN luarocks install kong-log-google

COPY kong/plugins/oidc-consumer /usr/local/share/lua/5.1/kong/plugins/oidc-consumer
COPY kong_oidc_schema.lua /usr/local/share/lua/5.1/kong/plugins/oidc/schema.lua
COPY kong_oidc_utils.lua /usr/local/share/lua/5.1/kong/plugins/oidc/utils.lua

#CMD ["kong", "migrations", "bootstrap"]
CMD ["sh", "-c", "kong migrations up && kong migrations finish && kong start"]
