# Booting dynebolic on various media

There are many ways to boot dynebolic on your computer. First, you need to [download the ISO](https://dyne.org/dynebolic/download/) file and verify the checksum.

## Booting from usb

### On windows

On Windows you can use an application called [Rufus](https://rufus.ie/) to flash the ISO file to a USB drive.
The interface is very intuitive, plug the usb stick, select the volume to install on and the ISO image you just downloaded to install. After pressing start it will recognize the image and will ask you to either install normally or in `dd mode`, ⚠️ **please select `dd mode`**.

### On GNU+Linux

On GNU+Linux, find the device of your USB stick, read your system messages via `dmesg` command, it should be something like `/dev/sdX` (where "X" is a letter defined by your system) then run this command as root:

`dd bs=4M if=dynebolicIV.iso of=/dev/sdX status=progress && sync`

⚠️ Note that you *have* to adapt this line so that "X" represents its actual value in your system.

The USB stick will be ready to boot, **be sure to know the hotkey to press at boot for boot selection, or bios interface to configure USB boot**.

