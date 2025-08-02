#!/bin/bash

DESKTOP_FILE="/usr/share/applications/io.element.Element.desktop"

# Only patch if --password-store is not already present
if grep -q '^Exec=' "$DESKTOP_FILE" && ! grep -q -- '--password-store="kwallet6"' "$DESKTOP_FILE"; then
    # Insert kwallet6 arg before %u
    sed -i 's|\(Exec=.*\) %u|\1 --password-store="kwallet6" %u|' "$DESKTOP_FILE"
fi
