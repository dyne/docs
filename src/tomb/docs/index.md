---
layout: ../../layouts/Layout.astro
title: "Tomb :: Folder Encryption on GNU/Linux"
description: "Tomb is a system to make strong encryption easy for everyday use. A tomb is like a locked folder that can be safely transported and hidden in a filesystem."
cover: "https://dyne.org/social/tomb.png"
---

![](https://www.dyne.org/wp-content/uploads/2011/10/tomb_n_bats.png "tomb_n_bats")

Tomb is a **100% free and open source** tool that facilitates managing secret files in volumes protected by **strong encryption**.

Tomb's ambition is to improve safety by way of:

- a **minimalist** design consisting of small and readable code
- the facilitation of **good practices**, i.e.: key/storage physical separation
- the adoption of a few standards and **battle-tested** components


## How it works

We design Tomb's hidden file encryption to generate encrypted **storage folders** to be opened and closed using associated **key files**, which are also protected with a **password** chosen by the user.

A tomb is a file whose **contents are kept secret and indistinguishable**; it can be safely **renamed, transported and hidden in filesystems**; its **keys should be kept separate**, for instance, keeping the tomb file on your computer's hard disk and the key files on a USB stick. **Once open, the tomb looks like a folder**.

Tomb derives from scripts used in the [dyne:bolic](http://dynebolic.org/) 100% Free GNU/Linux distribution and a shell script (Zsh) using standard filesystem tools (GNU) and the cryptographic API of the Linux kernel (dm-crypt and LUKS via cryptsetup). Tomb's status and error messages are **translated into many human languages** and have **multiple graphical applications** to operate.


![awesome-shot](https://www.dyne.org/wp-content/uploads/2011/11/awesome-shot.png)

# Get Started

**Tomb works only on GNU/Linux systems and WSL2 starting with Windows11**.

If you are already familiar with using the command line, [download the tar.gz](https://files.dyne.org/tomb) and jump to the [installation instructions](https://github.com/dyne/Tomb/blob/master/INSTALL.md).

Tomb is also found in [many distributions](https://repology.org/project/tomb/versions), so you can use your package manager to install it.

However, **Tomb is a single script** and is very easy to install manually. Using `make install` in our source distribution will copy it into `/usr/local/bin` along with its manpage (`man tomb`) and language translations.

Be in charge of your system, and **may the source be with you**!

![tomb\_songs](https://www.dyne.org/wp-content/uploads/2011/11/tomb_songs.png)

## Usage

Tombs are operated from a terminal command line and require **root access** to the machine (or just sudo access to the script).

To create a 100MB tomb called "secret" do:

```
tomb dig -s 100 secret.tomb
tomb forge secret.tomb.key
tomb lock secret.tomb -k secret.tomb.key
```

To open it, do
```
tomb open secret.tomb -k secret.tomb.key
```
And to close it
```
tomb close
```
Or if you are in a hurry
```
tomb slam all
```
Will close immediately all open tombs, killing all applications using them.

Here is a **lovely review made by the Linux Action Show guys** in August 2014, where they recommend Tomb as a replacement for Veracrypt

<a href="https://www.youtube-nocookie.com/embed/CMLJmfjCaGM?si=HZX5rpKEVq_QWSg6">
<img src="https://github.com/dyne/dyne.github.io/assets/148059/5635a613-8caf-4ebc-8ae0-9440a1a2bd5d" width="80%">
</a>


## Advanced usage

The tomb script takes care of several details to improve a user’s
behaviour and the security of tombs in everyday usage: it protects the
typing of passwords from keyloggers, facilitates hiding keys inside
images, mounts directories in place without copying delicate files around, allows a user to kill all running processes and slam close a tomb in a straightforward command, warns the user about free space and last-time usage, etc.

![Tomb logo by monmort](https://www.dyne.org/wp-content/uploads/2011/11/monmort1.png)

One can use **multiple tombs** simultaneously on the same system and list them using `tomb list`.

![Tomb logo by monmort](https://www.dyne.org/wp-content/uploads/2011/11/monmort1.png)

Using `tomb resize`, one can **expand tombs** to have more space (but cannot shrink them).

![Tomb logo by monmort](https://www.dyne.org/wp-content/uploads/2011/11/monmort1.png)

When it is open, a tomb can **bind contents inside the user’s `$HOME`** folder using `bind-hooks`. For instance, `.gnupg` will only be found inside your `$HOME` when the tomb opens. 

![Tomb logo by monmort](https://www.dyne.org/wp-content/uploads/2011/11/monmort1.png)

A tomb can be used on a local machine with **keys on a server** and never stored on the same device: `ssh me@dyne.org 'cat my.tomb.key' | tomb open my.tomb -k -` the option `-k -` tells tomb to take the key from stdin.

![Tomb logo by monmort](https://www.dyne.org/wp-content/uploads/2011/11/monmort1.png)

It is also possible to **store a tomb on a cloud service and mount it locally**, ensuring remote servers cannot access contents. One can use **sshfs** for this:

```
sshfs -o allow_root me@dyne.org:/ /mnt/cloud/
tomb open /mnt/cloud/my.tomb -k my.key
```

[This paper](https://www.researchgate.net/publication/262698824_Data_privacy_in_Desktop_as_a_Service) provides a lot of details about using tombs hosted on cloud storage.

![Tomb logo by monmort](https://www.dyne.org/wp-content/uploads/2011/11/monmort1.png)

Tomb also supports **deniable key storage** using steganography. One can `tomb bury` and `tomb exhume` keys to and from `JPEG` images when the utility `steghide` is installed. When securing private data, one must never forget where the keys are. It may be easier to remember a picture, as well it may be less suspicious to transport it and exchange it as a file.

![Tomb logo by monmort](https://www.dyne.org/wp-content/uploads/2011/11/monmort1.png)

The command `tomb engrave` also allows to backup keys on paper by saving them as printable QR codes, to hide it between the pages of a book. To recover an engraved key, one can scan it with any phone and save the resulting plain text file as the tomb key.

<a href="https://www.youtube-nocookie.com/embed/IgO19-3ffrY">
<img src="https://github.com/dyne/dyne.github.io/assets/148059/183bd300-dfca-457d-b50b-2f8826dec187" width="80%">
</a>

You can also watch this other video guide by Nerd on the Street.

## External applications

The following applications are compatible with Tomb:

- [pass-tomb](https://github.com/roddhjav/pass-tomb) is a console-based wrapper of the excellent password-keeping program [pass](https://www.passwordstore.org) that helps to keep the whole tree of passwords encrypted inside a tomb.

- [Secrets](https://secrets.dyne.org) is an online software to split a Tomb key into shares that a quorum of owners can merge to reconstitute.

- [Mausoleum](https://github.com/mandeep/Mausoleum) is a graphical interface to facilitate the creation and management of tombs, written in Python.

- [zuluCrypt](https://mhogomchungu.github.io/zuluCrypt/) is a graphical application to manage various types of encrypted volumes on GNU/Linux, among them also Tombs, written in C++.




# How secure is Tomb?

**Death is the only sure thing in life**. That said, Tomb is a pretty
secure tool mainly because it is kept minimal, its source is
always open to review (even when installed), and its code is easy to
read with some shell script knowledge. Plus, **no cloud or network connection is needed: Tomb works offline**.

GNU/Linux distributions include all encryption tools we use in Tomb 
and therefore, they are regularly peer-reviewed: we don't add anything else to them, just a layer of usability.

If needed, **it is always possible to access the contents of a tomb without the tomb script**, only using a few commands typed into any shell interpreter:

```
lo=$(losetup -f)
losetup -f secret.tomb
gpg -d secret.key | head -c -1 | cryptsetup --key-file - luksOpen $lo secret
mount /dev/mapper/secret /mnt
```

One can change the last argument `/mnt` to where the Tomb has to be
mounted and made accessible. To close the tomb, use:

```
umount /mnt
cryptsetup luksClose /dev/mapper/secret
```



## Who needs Tomb

> Democracy requires privacy as much as Freedom of Expression. - Anonymous

The world is full of prevarication and political imprisonments, war rages in several places, and media is mainly used for propaganda by the powers in charge. Some of us face the dangers of being tracked by oppressors opposing our self-definition, independent thinking and resistance to homologation.

Our target community are GNU/Linux users with no time to click around, sometimes using old or borrowed computers, operating in places endangered by conflict where **a leak of personal data can be a threat**.

Even if one can't own a laptop, Tomb makes it possible to go around with a USB stick and borrow computers, leaving no trace and keeping data safe during transport.


> The distinction between public and private is becoming increasingly blurred with the increasing intrusiveness of the media and advances in electronic technology. While this distinction is always the outcome of continuous cultural negotiation, it continues to be critical, for where nothing is private, democracy becomes impossible.

The Internet offers plenty of free services; in most cases, **corporate or state monopolies host all private information**. Server-hosted services and web-integrated technologies gather all data into huge information pools made available to established economic and cultural regimes.

**Tomb is ethical software that empowers everyone to protect their privacy**.

<img src="https://www.dyne.org/wp-content/uploads/2012/06/foster_privacy.png">


## Aren't there enough encryption tools?

The current situation in personal desktop encryption is far from optimal.

The encrypted home mechanism of most operating systems doesn’t make it easy to transport around, and they do not separate the keys from the storage: only the password is needed to open them, which is prone to brute-forcing attacks. 

[TrueCrypt](http://en.wikipedia.org/wiki/TrueCrypt) makes use of statically linked libraries so that its code is hard to audit, plus is [not considered free](http://lists.freedesktop.org/archives/distributions/2008-October/000276.html) by operating system distributors because of liability reasons, see [Debian](http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=364034), [Ubuntu](https://bugs.edge.launchpad.net/ubuntu/+bug/109701), [Suse](http://lists.opensuse.org/opensuse-buildservice/2008-10/msg00055.html), [Gentoo](http://bugs.gentoo.org/show_bug.cgi?id=241650) and [Fedora](https://fedoraproject.org/wiki/ForbiddenItems#TrueCrypt).

[Veracrypt](https://veracrypt.org) is a very portable rewrite of TrueCrypt (works also on Mac OSX) but is very slow and has some interaction patterns that are not secure. Its way of encrypting is comparable to Tomb.

[EncFS](http://www.arg0.net/encfs) doesn’t need root access. But it has drawbacks: it implements weaker encryption, doesn't promote the separated storage of keys and exposes the size of each single file rather than hiding the structure of a folder.

<a href="https://www.youtube-nocookie.com/embed/4VcJtj_oGqg">
  <img src="https://github.com/dyne/dyne.github.io/assets/148059/05ae0f87-17c6-4937-a94d-a2549b00f45a">
</a>

Watch Tomb's development history in this infographic based on git commits.

## Compliancy

Tomb qualifies as sound for use on information rated as "top secret"
when used on an underlying stack of carefully reviewed hardware
(random number generator and other components) and software (Linux
kernel build, crypto modules, device manager, compiler used to built,
shell interpreter and packaged dependencies).

Tomb volumes are fully compliant with the FIPS 197 advanced encryption
standard published by NIST and with the following industry standards:

- Information technology -- Security techniques -- Encryption algorithms
	- [ISO/IEC 18033-1:2015](http://www.iso.org/iso/home/store/catalogue_tc/catalogue_detail.htm?csnumber=54530)  -- Part 1: General
	- [ISO/IEC 18033-3:2010](http://www.iso.org/iso/home/store/catalogue_ics/catalogue_detail_ics.htm?csnumber=54531) -- Part 3: Block ciphers

Tomb implementation is known to address at least partially issues raised in:

- Information technology -- Security techniques -- Key management
	- [ISO/IEC 11770-1:2010](http://www.iso.org/iso/home/store/catalogue_tc/catalogue_detail.htm?csnumber=53456)  -- Part 1: Framework
	- [ISO/IEC 11770-2:2008](http://www.iso.org/iso/home/store/catalogue_tc/catalogue_detail.htm?csnumber=46370)  -- Part 2: Mechanisms using symmetric techniques
- [ISO/IEC 27005:2011](http://www.iso.org/iso/home/store/catalogue_tc/catalogue_detail.htm?csnumber=56742) Information technology -- Security techniques -- Information security risk management
- [ISO/IEC 24759:2014](http://www.iso.org/iso/home/store/catalogue_tc/catalogue_detail.htm?csnumber=59142) Information technology -- Security techniques -- Test requirements for cryptographic modules

Any help on further verification of compliance is very welcome, as our
access to ISO/IEC documents is limited.







# Development

<a href="https://github.com/dyne/Tomb">
<img src="https://www.dyne.org/wp-content/uploads/2011/11/github_tomb.jpg">
Tomb is on GitHub</a>, where most of the community activity goes.

Developers can interact with us via a discussion area, issues, or pull requests. The README is also a brief introduction for developers willing to engage.

The [short tomb tester howto](https://github.com/dyne/Tomb/wiki/TesterHowTo) provides a guide to troubleshooting problems. Anyone planning to write code in Tomb should first look at the [short tomb developer howto](https://github.com/dyne/Tomb/wiki/DeveloperHowto).

To get in touch with us in person please plan to participate in one of the yearly [italian hackmeeting](http://hackmeeting.org), usually held during summer on the peninsula.

[![](https://www.dyne.org/wp-content/uploads/2011/10/tomb_crew_hkm11.jpg "tomb_crew_hkm11")](https://www.dyne.org/wp-content/uploads/2011/10/tomb_crew_hkm11.jpg)

A cheerful picture of Tomb developers crew at Hackmeeting 2011 in Firenze


> All I know is what the words know, and dead things, and that makes a handsome little sum, with a beginning and a middle and an end, as in the well-built phrase and the long sonata of the dead. - Samuel Beckett

