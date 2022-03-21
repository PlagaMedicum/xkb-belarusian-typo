#!/usr/bin/env sh

EVDEV_PATH=/usr/share/X11/xkb/rules/evdev.xml
SYMBOLS_PATH=/usr/share/X11/xkb/symbols/by

help()
{
  cat << EOM
This script adds extra configurations for belarusian keyboard layouts in xkb.

USAGE:
    ./belxkb [OPTIONS]
OPTIONS:
    --help    -h  Help.
    --install -i  Installs 3 new belarusian keyboard layouts:
                    1. Belarusian Typo (cyrillic)
                    2. Belarusian alt. Typo (russian chars first)
                    3. Belarusian Latin typo
    -- backup -b  Restores config files from backup
    --flag    -f  Replaces BSSR-style flag to the national flag of Belarus.
EOM
}

create_backup()
{
  sudo rm -rf ./backup
  mkdir ./backup
  sudo cp -rf $EVDEV_PATH ./backup/evdev.xml
  sudo cp -rf $SYMBOLS_PATH ./backup/by
}

install()
{
  sudo cp -rf ./evdev.xml $EVDEV_PATH
  sudo cp -rf ./by $SYMBOLS_PATH
}

xfce4_flag()
{
  mkdir -p ~/.local/share/xfce4/xkb/flags/
  cp ./by.svg ~/.local/share/xfce4/xkb/flags/
}

backup()
{
  sudo cp -rf ./backup/evdev.xml $EVDEV_PATH
  sudo cp -rf ./backup/by $SYMBOLS_PATH
}

case "$1" in
  --install | -i)
    create_backup
    install
  ;;
  --flag | -f)
    xfce4_flag
  ;;
  --backup | -b)
    backup
  ;;
  *)
    help
  ;;
esac

exit 0
