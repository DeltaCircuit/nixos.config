if [ "$(tty)" = "/dev/tty1" ]; then
  export XCURSOR_SIZE=40
  exec sway
fi
