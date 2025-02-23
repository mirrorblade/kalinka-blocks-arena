#!/bin/bash

# $1 - plugins folder
# $2 - output folder

if [ -z $1 ]; then
  echo "No plugins folder specified"
  echo "USAGE: ./plugin_loader.sh PLUGINS_FOLDER OUTPUT_FOLDER"

  exit 1
elif [ -z $2 ]; then
  echo "No output folder specified"
  echo "USAGE: ./plugin_loader.sh PLUGINS_FOLDER OUTPUT_FOLDER"

  exit 1
fi

absolute_output_path=$(readlink -f $2)

mkdir -p "$absolute_output_path/addons/sourcemod/configs"
mkdir -p "$absolute_output_path/cfg"

for plugin_folder in $(ls -d $1/*/); do
  plugin_name=${plugin_folder%/}
  plugin_name=${plugin_name##*/}

  for dir in $(ls -d $plugin_folder*/); do
    case $(basename $dir) in

    # cstrike/addons/sourcemod/(scripting, translations, plugins)
    "scripting" | "translations" | "plugins")
      cp -r "$dir/"* "$absolute_output_path/addons/sourcemod/$(basename $dir)"
      ;;

    # cstrike/(models, materials)
    "models" | "materials")
      cp -r "$dir/"* "$absolute_output_path/$(basename $dir)"
      ;;

    # cstrike/addons/sourcemod/configs
    "configs")
      cp -r "$dir/"* "$absolute_output_path/addons/sourcemod/configs/"
      ;;

    # cstrike/cfg
    "cvars")
      if [[ -e "$dir/config.cfg" ]]; then
        cat "$dir/config.cfg" >>"$absolute_output_path/cfg/$plugin_name.cfg"
        printf "\nexec $plugin_name.cfg\n" >>"$absolute_output_path/cfg/server.cfg"

        mv "$dir/config.cfg" "$dir/.config.cfg"
        cp -r "$dir/"* "$absolute_output_path/cfg"
        mv "$dir/.config.cfg" "$dir/config.cfg"
      fi
      ;;
    esac
  done
done

if [[ -z $(ls "$absolute_output_path/cfg") ]]; then
  rm -r "$absolute_output_path/cfg"
fi

if [[ -z $(ls "$absolute_output_path/addons/sourcemod/configs") ]]; then
  rm -r "$absolute_output_path/addons/sourcemod/configs"
fi
