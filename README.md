# backup-rsync


Solution to backup of my personal files.

The script call is commonly added on `cron`.

	# crontab -e

Crontab usage:

	00 21 * * * /some/path/to/backup-rsync.sh [dev-mount] [src-path] [dest-path] [scripts-home]

Example:

	./backup-rsync.sh /dev/sdb1 /home/user /home/user/tmp/pendrive /home/user/code/backup-rsync

