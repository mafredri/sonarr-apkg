#!/bin/sh

if [ -z "$APKG_PKG_DIR" ]; then
	PKG_DIR=/usr/local/AppCentral/sonarr
else
	PKG_DIR=$APKG_PKG_DIR
fi

case "${APKG_PKG_STATUS}" in
	install)
		;;
	upgrade)
		# Source env variables
		. "${PKG_DIR}/CONTROL/env.sh"

		# Back up configuration
		rsync -ra --exclude "config_base.xml" "$PKG_CONF/" "$APKG_TEMP_DIR/config/"

		# Back up application
		if [ -d "$PKG_DIR/Sonarr" ]; then
			cp -af "$PKG_DIR/Sonarr" "$APKG_TEMP_DIR/"
		fi
		;;
	*)
		;;
esac

exit 0
