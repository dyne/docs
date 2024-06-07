# Booting dynebolic

There are many ways to boot dynebolic on your computer. First, you need to [download the ISO](https://dyne.org/dynebolic/download/) file and verify the checksum.

## Booting from usb

### On windows

On Windows you can use an application called [Rufus](https://rufus.ie/) to flash the ISO file to a USB drive.
The interface is very intuitive, plug the usb stick, select the volume to install on and the ISO image you just downloaded to install. After pressing start it will recognize the image and will ask you to either install normally or in `dd mode`, **please select `dd mode`**.

### On GNU+Linux

On GNU+Linux, find the device of your USB stick, read your system messages via `dmesg` command: `dmesg | grep " sd "`

The name you are looking for should be something like `/dev/sdX` (where "X" is a letter defined by your system). Read the information carefully, because it will include de `sdX` name of the main drive of your computer. Once you've determined the name of your USB stick, run this command as root:

`dd bs=4M if=dynebolicIV.iso of=/dev/sdX status=progress && sync`

!!! note

    You *have* to adapt this line so that "X" represents its actual value in your system.

Once this command has completed, the USB stick will be ready to boot.

**Be sure to know the hotkey to press at boot for boot selection, or bios interface to configure USB boot**.

## Booting in a Virtual Machine

A virutal machine allows you to run an Operative System within your running Operative system. This way you can leverage all that dynebolic has to offer without the need to install it on your machine.

#### Virtual Machine Manager

On of the most user-friendly ways to run dynebolic in a virutal machine is using [Virtual Machine Manager](https://virt-manager.org/). This tool will provide you with a GUI and take care of many complicated parts such as the routing to your physical audio and network tools more or less seemlessly. It also sets everything up to have copy+paste working from your physical machine's desktop to dynebolic.

To install Virtual Machine Manager, follow the [instructions on their website](https://virt-manager.org/)

Once installed you can run it an add a virtual machine.

Hit the "+" button in the upper left corner of the GUI. You will be presented with a prompt asking you to choose how you would like to install the operative system.

<figure markdown="span">
  ![Chose "Local install media"](images/choose.webp)
  <figcaption>Chose "Local install media"</figcaption>
</figure>

In the next panel, you are asked to pick the file you want to use.

<figure markdown="span">
  ![Pick the isofile](images/pick.webp)
  <figcaption>Pick the ISO file you downloaded</figcaption>
</figure>


#### QEMU (TODO)
[QEMU](https://www.qemu.org/) is a generic and open source machine emulator and virtualizer.





### On windows (todo)
