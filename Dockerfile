FROM kong:0.15.0-alpine

RUN luarocks install kong-oidc
RUN luarocks install kong-oidc-consumer

COPY kong/plugins/oidc-consumer /usr/local/share/lua/5.1/kong/plugins/oidc-consumer
COPY kong_oidc_schema.lua /usr/local/share/lua/5.1/kong/plugins/oidc/schema.lua
COPY kong_oidc_utils.lua /usr/local/share/lua/5.1/kong/plugins/oidc/utils.lua
#CMD ["kong", "migrations", "bootstrap"] # TODO find better solution - only needs to run once
#CMD ["kong", "migrations", "up"]
