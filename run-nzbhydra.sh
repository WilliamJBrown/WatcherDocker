#!/usr/bin/env bash

# Check our uid/gid, change if env variables require it
if [ "$( id -u nzbhydra )" -ne "${LUID}" ]; then
    usermod -o -u ${LUID} nzbhydra
fi

if [ "$( id -g nzbhydra )" -ne "${LGID}" ]; then
    groupmod -o -g ${LGID} nzbhydra
fi

# Set permissions
chown -R nzbhydra:nzbhydra /config/ /opt/nzbhydra

exec runuser -l nzbhydra -c 'python /opt/nzbhydra/app/nzbhydra.py --nobrowser --config /config/nzbhydra.cfg --database /config/nzbhydra.db'
