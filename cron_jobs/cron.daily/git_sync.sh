# !/bin/bash

cd /home/consularparadi/.dotfiles
git pull origin main && git add . && git commit -m "Commited on $(date)" && git push origin main

cd -
