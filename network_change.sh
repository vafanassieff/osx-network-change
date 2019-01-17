#!/bin/bash

TARGET_WIFI_NETWORK="Super Network SSID"
USER="user"
GROUP="group"
VOLUME_MOUNT_POINT="TimeMachine"

MOUNT_TYPE="afp"
MOUNT_CMD="mount_afp"

NETWORK_DRIVE_ADDRESS="0.0.0.0"
NETWORK_DRIVE_USER="timemachime"
NETWORK_DRIVE_PWD="timemachime"
NETWORK_DRIVE_SHARE="TimeMachine"

CURRENT_WIFI_NETWORK=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}')
VOLUME_PATH="/Volumes/$VOLUME_MOUNT_POINT"


if [[ "$CURRENT_WIFI_NETWORK" == $TARGET_WIFI_NETWORK ]]; then
	if mount | grep -q //$NETWORK_DRIVE_USER@$NETWORK_DRIVE_ADDRESS; then
		echo "Already mounted"
	else
		mkdir -p $VOLUME_PATH
		chown $USER:$GROUP $VOLUME_PATH
		su $USER -c "${MOUNT_CMD} ${MOUNT_TYPE}://${NETWORK_DRIVE_USER}:${NETWORK_DRIVE_PWD}@${NETWORK_DRIVE_ADDRESS}/${NETWORK_DRIVE_SHARE} ${VOLUME_PATH}"
	fi
fi
