FROM materialsproject/devops:kong-oidc-1.51.1

USER root
COPY . /kong-oidc-consumer
RUN cd /kong-oidc-consumer && luarocks make

USER kong
#CMD ["kong", "migrations", "bootstrap"]
CMD ["sh", "-c", "kong migrations up && kong migrations finish && kong start"]
