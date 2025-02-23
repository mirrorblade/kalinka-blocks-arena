FROM lacledeslan/gamesvr-cssource

COPY --chown=CSSource:root / /app/cstrike

RUN ["/app/cstrike/plugins/plugin_loader.sh", "/app/cstrike/plugins", "/app/cstrike"]

USER CSSource

WORKDIR /app/

ONBUILD USER root