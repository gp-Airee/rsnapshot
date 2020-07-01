#! /bin/sh

cat > /etc/rsnapshot.conf <<EOF
config_version	1.2
snapshot_root	/backup/
no_create_root	1
cmd_cp	/bin/cp
cmd_rm	/bin/rm
cmd_rsync	/usr/bin/rsync
cmd_ssh	/usr/bin/ssh
ssh_args	-p 9030 -i /key -o StrictHostKeychecking=no -o UserKnownHostsFile=/dev/null
verbose	3
lockfile	/var/run/rsnapshot.pid
retain	client	28
backup	${BACKUP_SOURCE}	${BACKUP_NAME}
EOF

rsnapshot client
