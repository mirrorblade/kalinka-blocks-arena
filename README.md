A Counter-Strike: Source server based on https://github.com/LacledesLAN/gamesvr-cssource.


[![Kalinka Block Arena Server Status](https://cache.gametracker.com/server_info/83.217.214.157:27015/b_560_95_1.png)](https://www.gametracker.com/server_info/83.217.214.157:27015/)


## Build & Run Docker Image/Container For Development/Testing

Check the VS Code tasks [tasks.json](./.vscode/tasks.json)

## Quick Links
- Server config: [server.cfg](.//cfg/server.cfg)
- Sourcemod admins: [admins_simple.ini](./plugins/addons/admins/configs/admins_simple.ini)

## Server Setup

> tl;dr: For sourcemod plugins and configuration update `plugins/`

The [linux.Dockerfile](./linux.Dockerfile) file will create the server's `cstrike/` folder based on the following 4 folders:

- addons/: Provides the vanilla metamod and sourcemod plugins downloaded by [prepare_sourcemod.sh](./prepare_sourcemod.sh) script.
- [cfg/](./cfg/): Keeps server and sourcemod configuraions.
- [maps/](./maps): Provides maps for the game.
- [plugins/](./plugins/): Used to install sourcemod plugins.
