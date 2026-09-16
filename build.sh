#!/usr/bin/sh

src_dir=src/
build_dir=build/
assets_dir=assets/
raw_assets_dir=assets_raw/

FULL_PATH=$(realpath "$0")
BASE_DIR=$(dirname $FULL_PATH)
ROM_NAME=$(basename $BASE_DIR)

name=$(basename "$PWD")
name="${name,,}"

#if param at index 1 is set the programm will continue
doHalt="$1"
doHalt="${doHalt,,}"

if [ -z "$2" ]
then
    echo "create assets"
    #original color palette for DMG
    colorPal="#9bbc0f,#8bac0f,#306230,#0f380f,#0f380f" 
    #convert original images to colorpal
    java -jar ../tools/gfx.jar -conv ${raw_assets_dir}sprites.png ${assets_dir}sprites.png ${colorPal}
    java -jar ../tools/gfx.jar -conv ${raw_assets_dir}background.png ${assets_dir}background.png ${colorPal}
    #creates tileset.png from assets into pwd
    java -jar ../tools/gfx.jar -crt ${assets_dir}sprites.png ${assets_dir}background.png ${assets_dir}background.png -u -fill
    #mv created tileset inside asset dir
    mv tileset.png ${assets_dir}tileset.png
    #create tiledmaps and tileset.chr from tileset.png
    java -jar ../tools/gfx.jar -o ${assets_dir}tileset.png ${assets_dir}tileset.chr -u -c -scp 1 -t ${assets_dir}background.png
else
    echo "no assets created!"
fi

rm -rf ${build_dir}/* 

rgbgfx --output ${assets_dir}tileset.chr ${assets_dir}/tilesetOut.png -r 16

#build main.asm
rgbasm -Werror -Weverything -o ${build_dir}main.o ${src_dir}main.asm

#build sample.asm
rgbasm -Werror -Weverything -o ${build_dir}sample.o ${src_dir}sample.asm

#build hUGEDiver
rgbasm -Werror -Weverything -o ${build_dir}hUGEDriver.o ${src_dir}include/hUGEDriver.asm

#link things together
rgblink --dmg --tiny --map ${build_dir}${name}.map --sym ${build_dir}${name}.sym -o ${build_dir}${name}.gb ${build_dir}main.o ${build_dir}sample.o ${build_dir}hUGEDriver.o

#fix header
rgbfix --title game --pad-value 0 --validate ${build_dir}${name}.gb

#if no break param is set (param at index one) we assume double click on script file to keep it open
if [ -z "$doHalt" ]; 
then
    echo "No param set for continue programm"
    read
else
    echo "Break param='$doHalt'"
fi

