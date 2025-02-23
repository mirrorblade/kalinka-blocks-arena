A Counter-Strike: Source server based on https://github.com/LacledesLAN/gamesvr-cssource.


[![Kalinka Block Arena Server Status](https://cache.gametracker.com/server_info/83.217.214.157:27015/b_560_95_1.png)](https://www.gametracker.com/server_info/83.217.214.157:27015/)


## Build & Run Docker Image/Container For Development/Testing

Check the VS Code tasks [tasks.json](./.vscode/tasks.json)

## Quick Links
- Server config: [server.cfg](./cstrike/cfg/server.cfg)
- Sourcemod admins: [admins_simple.ini](./cstrike_for_sourcemod_overwrite/addons/sourcemod/configs/admins_simple.ini)

## Server Setup

> tl;dr: For sourcemod plugins and configuration update `cstrike_for_sourcemod_overwrite/` and for everything else update `cstrike/`

The [linux.Dockerfile](./linux.Dockerfile) file will create the server's `cstrike/` folder based on the following 3 folders:

- [cstrike/](./cstrike/): Provides server configuration, non-sourcemod plugins and addons.
- [cstrike_for_sourcemod_default/](./cstrike_for_sourcemod_default/): Provides the vanilla metamod and sourcemod plugins downloadeded from https://www.metamodsource.net/downloads.php/?branch=master and https://www.sourcemod.net/downloads.php?branch=dev (sourcemod requires metamod)
  - This folder will be completely replaced when there are new sourcemod versions. The only thing to potentially modify is moving unneeded plugins to `cstrike_for_sourcemod_default/addons/sourcemod/plugins/disabled`. If you modify the configuration, it will be lost. Instead, add configuration to `cstrike_for_sourcemod_overwrite/` (see below).  
- [cstrike_for_sourcemod_overwrite/](./cstrike_for_sourcemod_overwrite/): Used to install sourcemod plugins and to provide sourcemod configuration.

