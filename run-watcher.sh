#!/usr/bin/env bash

# Check our uid/gid, change if env variables require it
if [ "$( id -u watcher )" -ne "${LUID}" ]; then
    usermod -o -u ${LUID} watcher
fi

if [ "$( id -g watcher )" -ne "${LGID}" ]; then
    groupmod -o -g ${LGID} watcher
fi

# Set permissions
chown -R watcher:watcher /config/ /opt/watcher

exec runuser -l watcher -c 'python /opt/watcher/app/watcher.py --nobrowser --config /config/watcher.cfg --database /config/nzbhydra.db'
