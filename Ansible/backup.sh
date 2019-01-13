#!/usr/bin/bash
# Dump all MySQL/MariaDB databases

PASSWD="Password123"
TARGET=192.168.60.6

mysqldump -h 192.168.60.5 --all-databases --single-transaction --quick --lock-tables=false > full-backup-$(date +%F).sql -u root -p$PASSWD | gzip -c | ssh root@$TARGET 'cat > ~/dump.sql.gz'