#!/usr/bin/env sh

EVDEV_PATH=/usr/share/X11/xkb/rules/evdev.xml
SYMBOLS_PATH=/usr/share/X11/xkb/symbols/by

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

backup()
{
  sudo cp -rf ./backup/evdev.xml $EVDEV_PATH
  sudo cp -rf ./backup/by $SYMBOLS_PATH
}

case "$1" in
  install | -i)
    create_backup
    install
  ;;
  backup | -b)
    backup
  ;;
  *)
    echo "See installation guide at https://github.com/PlagaMedicum/Belarusian-Typo-Keyboard"
  ;;
esac

exit 0
