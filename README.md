# backup-rsync

Simple backup script using linux `rsync` application.

The destination is mounted; the required data is copied/updated; the detination is then unmounted.

Tested in Archlinux. The only requirement is to have `rsync` installed.

## Usage

### Command line

The script can be called by informing the required parameters as below:

	/some/path/to/backup-rsync.sh [dev-mount] [src-path] [dest-path]

If the required parameters were not informed, the `usage help` will appear.

After execution, the `backup-rsync.log` will be created (or data will be appended 
if file already exists). This file resides in the same directory of the shell file.

### Cron

The script call is commonly added on `cron`.

	# crontab -e

Crontab usage:

	00 21 * * * /some/path/to/backup-rsync.sh [dev-mount] [src-path] [dest-path]

### Example

	./backup-rsync.sh /dev/sdb1 /home/user /home/user/tmp/pendrive 


