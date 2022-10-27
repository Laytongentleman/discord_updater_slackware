#!/bin/bash
set -e
Green=$'\e[1;32m'
Blue=$'\e[1;34m'
echo -n "$Green  Indique la version qu'il faut aller chercher: "
read newver
echo "on va installer la version $newver"

builder="/home/louis/Public/discord/discord.SlackBuild"
echo "$Blue"
file=$"discord-${newver}.deb"
wget -c "https://discord.com/api/download/stable?platform=linux&format=deb" -O $file
mv $file "/home/louis/Public/discord/"
a='s/VERSION=${VERSION:.*/VERSION=${VERSION:-'  
complexe="$a$newver}/"
echo $complexe
sed -i $complexe /home/louis/Public/discord/discord.SlackBuild  


b="/tmp/discord-"
ok="-x86_64-1_SBo.tgz"
prompt="$b$newver$ok"


cd /home/louis/Public/discord/

su -c "./discord.SlackBuild && upgradepkg $prompt && rm $prompt"

