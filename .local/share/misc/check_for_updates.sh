#!/usr/bin/env sh

# /etc/cron.daily/check_for_updates.sh

# Refreshes the master package database.
# This is useful for detecting updates using `pacman -Qu` as a non-root user
pacman -Sy
