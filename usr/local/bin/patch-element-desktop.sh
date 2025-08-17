#!/bin/bash

DESKTOP_FILE="/usr/share/applications/io.element.Element.desktop"

# Only patch if --password-store is not already present
if grep -q '^Exec=' "$DESKTOP_FILE" && ! grep -q -- '--password-store="gnome-libsecret"' "$DESKTOP_FILE"; then
    # Insert gnome-libsecret arg before %u
    sed -i 's|\(Exec=.*\) %u|\1 --password-store="gnome-libsecret" %u|' "$DESKTOP_FILE"
fi
