#!/bin/bash
set -e

help() {
  echo "
usage: backup-rsync [dev-mount] [src-path] [dest-path]
"
  exit 1
}

[ $# -ne 3  ] && help

dev_mount=$1
src_path=$2
dest_path=$3
script_home=$(cd $(dirname $0) && pwd)

mount $dev_mount $dest_path 

if grep -qs $dest_path /proc/mounts; then
  rsync -rv --update --exclude-from "$script_home/backup-rsync-exclude-list" $src_path/ $dest_path --log-file=$script_home/backup-rsync.log
  cp $script_home/backup-rsync.log $dest_path
  umount $dest_path
fi


