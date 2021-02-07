#!/bin/sh
echo "开始备份，路径为："$1
sudo tar cvpzf $1/backup.tgz --exclude=/proc --exclude=/lost+found --exclude=/backup.tgz --exclude=/mnt --exclude=/sys --exclude=/media / --warning=no-file-change
echo "结束备份"
