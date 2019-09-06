#!/usr/bin/env sh

EVDEV_PATH=/usr/share/X11/xkb/rules/evdev.xml
SYMBOLS_PATH=/usr/share/X11/xkb/symbols/by

create_backup()
{
  sudo cp $EVDEV_PATH ./backup/evdev.xml
  sudo cp $SYMBOLS_PATH ./backup/by
}

install()
{
  sudo cp ./evdev.xml $EVDEV_PATH
  sudo cp ./by $SYMBOLS_PATH
}

backup()
{
  sudo cp ./backup/evdev.xml $EVDEV_PATH
  sudo cp ./backup/by $SYMBOLS_PATH
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
