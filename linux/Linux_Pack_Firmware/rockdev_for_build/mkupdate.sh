#!/bin/bash
echo "start to make update.img..."
if [ ! -f "Image-rk3399_box/parameter.txt" ]; then
	echo "Error:No found parameter!"
	exit 1
fi
if [ ! -f "package-file" ]; then
	echo "Error:No found package-file!"
	exit 1
fi

./afptool -pack ./ Image-rk3399_box/update.img || pause
./rkImageMaker -RK330C Image-rk3399_box/MiniLoaderAll.bin Image-rk3399_box/update.img update.img -os_type:androidos || pause
echo "Making update.img OK."

rm Image-rk3399_box/update.img
cp update.img Image-rk3399_box/

exit 0