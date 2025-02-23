# Plugins Configuration

This folder contains plugins and their configurations. An example of plugin's structure:

```
├── plugins
│   ├── plugin1
│   │   ├── cvars
│   │   │   └── config.cfg
│   │   ├── configs
│   │   │   └── some_name.ini
│   │   ├── materials
│   │   │   └── para
│   │   ├── plugins
│   │   │   └── plugin1.smx 
│   │   └── scripting
│   │       └── ... 
│   └── plugin2
│       └── plugins
│           └── plugin2.smx
```

## Plugin Loader
This tool helps merging multiple plugins into specific folders. Files/folders in the output folder should be placed in the cstrike folder. Cvars folder must have file "config.cfg" that will have either plugin's cvars or executing another files with cvars.

## Usage
```zsh
$ ./plugin_loader.sh PLUGINS_FOLDER OUTPUT_FOLDER
```
