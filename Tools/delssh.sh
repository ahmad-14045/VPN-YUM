#!/bin/bash

read -p "Username For Delete : " Pengguna

if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel -f $Pengguna
        echo -e "Client : $Pengguna Telah Di Hapus !"
else
        echo -e "Client : $Pengguna Tidak Di Temukan !"
fi
