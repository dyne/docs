# Booting dynebolic on various media

## Booting from usb

### On windows

On Windows you can use an application called [Rufus](https://rufus.ie/).
The interface is very intuitive, plug the usb stick, select the volume to install on and the image to install, after pressing start it will recognize the image and will ask you to either install normally or in *dd mode*, **please select dd mode**.

### On GNU/Linux

On GNU/Linux find the device of your usb stick, read your system messages via dmesg command, it should be something like */dev/sdX*, then run this command as root:

`dd bs=4M if=dynebolicIV.iso of=/dev/sdX status=progress && sync`

The usb stick will be ready to boot, **be sure to know the hotkey to press at boot for boot selection, or bios interface to configure usb boot**.

