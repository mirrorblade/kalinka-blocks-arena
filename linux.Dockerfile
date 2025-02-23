FROM lacledeslan/gamesvr-cssource

COPY --chown=CSSource:root /cstrike_for_sourcemod_default /app/cstrike
COPY --chown=CSSource:root /cstrike_for_sourcemod_overwrite /app/cstrike
COPY --chown=CSSource:root /cstrike /app/cstrike

USER CSSource

WORKDIR /app/

ONBUILD USER root