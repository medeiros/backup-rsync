#!/bin/bash
set -e

help() {
  echo "
usage: backup-cp [dev-mount] [src-path] [dest-path]
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
  cp -Rv $src_path/* $dest_path &2> /dev/null
  umount $dest_path
fi


