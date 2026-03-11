if [[ "$DESKTOP_SESSION" == *"gnome"* || "$GDMSESSION" == *"gnome"* ]]; then
    gsettings set org.gnome.nautilus.preferences default-sort-order 'type'
fi
