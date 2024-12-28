if [ "$(tty)" = "/dev/tty1" ]; then
    if uwsm check may-start; then
        exec uwsm start -S -F Hyprland
    fi
fi
