# Getting Started with dynebolic

## Your Desktop Environment

*Dynebolic* doesn’t require you to install anything on your disks, which can be left untouched while the system is used. Still, depending on your preferred way to operate, it can boot from harddisks, CD, USB or network (explained in the following chapters) and it can store data in a single file that can be transported across different media.

The default desktop environment is KDE Plasma 6, which offer you multiple desktops (try ctrl+F2, F3, ecc) and a menu that can be recall by clicking the right mouse button on the background. On the upper right corner you have your storage devices which you can access with a click.

Inside the application menu organized in tasks you'll find the software available, so you can easily explore the variety of multimedia production tools and much more.

KDE Plasma offers *Activities*, which are a practical way to organize your workflows depending on the task at hand, whether you're editing video, recording and mixing audio, processing digital photographs, or running a live media stream.
When you start your *dynebolic* desktop session, there will be a number of pre-configured Activities: *Audio*, *Video*, *Streaming*, etc. You can think of these Activities as workplaces dedicated to a particular line of work. They are, of course, not exclusive: nothing stops you from pulling out *Inkscape* to work on an album cover for a track you're currently mastering in the Audio Activity.

In the following chapters we will look at what is available to you in each Activity.


### Package Management

To widen the pool of software available *Dynebolic* ships the default package manager for [Devuan](https://www.devuan.org/), the [Flatpak](https://flatpak.org) manager and the [GUIX](https://guix.gnu.org) package manger.

<!-- #### How to activate flatpak and guix -->

#### Tried and True, and now systemd-free thanks to Devuan.

*Dynebolic* is based on [Devuan](https://www.devuan.org), a fork of *Debian* with a wider choice of init systems than systemd, not only that, we have replaced the *Pulseaudio suite*, manager of the whole desktop audio stack, with [Pipewire](https://www.pipewire.org)! A new and emergent audio and video subsystem to manage all your needs.

<!-- #### Dynebolic Modules -->

<!-- The next generation of Linux package management. -->

## Working with Video

### Introduction

The GNU/Linux platform nowadays offers an interesting range of tools for video production, editing and manipulation; you can play all kind of video files, but also encode them for distribution and switch between formats. Furthermore, you’ll find software for recording, veejaying and streaming, non-linear editing and subtitling.

However, you should consider that most of the video tools running on GNU/Linux platform are in development: indeed you can help much in testing and reporting the bugs you encounter, that’s how anyone can help free software to grow better and better, as it does.

Now let's proceed on how to configure an available video device and then browse thru the video software included in dynebolic, following a subdivision in task categories.

### Configure your video devices

There are various devices that can be used on PC computers in order to have video input: USB webcams and capture cards, PCI TV cards, Firewire and even parallel port. They all have different chipsets and manufacturers and need different Linux device drivers.

*Dynebolic* is capable of automatically recognizing most PCI (internal) TV cards at boot time (WinTV, BTTV) and now also USB webcams as well as Firewire controllers: they will all be initialized at boot and can be accessed from the video device `/dev/video0` or subsequent numbers (`video1`, `video2` &#x2026;.) in case you have more than one. [FIXME: double-check that]

If your video device is not recognized automatically (the `/dev/video` doesn’t exist) then you need to configure it by hand.

If the online documentation says your device is supported by a particular kernel driver, you can try to load it using the command `modprobe modulename` and see if everything went well by looking in the last lines of the messages printed out by the `dmesg` command. Many modules are already present in *dynebolic*, but some might require to be compiled using the kernel sources, which is a more complicated process that can’t be explained here: you’ll need to find more instructions online about how to do it and download the Linux kernel sources. If you’ll even do it, keep in mind that once you have compiled your own kernel you have moved your very first step into becoming a hacker ;).

### Video tools and programs
#### KDEnlive

*KDEnlive* (the KDE Non-Linear Video Editor) is one of the best free and open-source video editing programs. It is based on the MLT Framework, which allows it to integrate many plugin effects for video and sound processing or creation. Furthermore *KDEnlive* brings a powerful titling tool, a DVD authoring solution, and can be used as a complete studio for video creation.

#### Frei0r

*Frei0r* is a free and open source plugin collection for video effects. Applications can use its API to embed more than 100 video filters, sources and mixers.

*Frei0r* is a minimalistic plugin API for video effects. The main emphasis is on simplicity for an API that will round up the most common video effects into simple filters, sources and mixers that can be controlled by parameters. It’s our hope that this way these simple effects can be shared between many applications, avoiding their reimplementation by different projects.

*Frei0r* is not meant as a competing standard to more ambitious efforts that try to satisfy the needs of many different applications and more complex effects. It is not meant as a generic API for all kinds of video applications, as it doesn’t provides things like an extensive parameter mechanism or event handling. Eventually the frei0r API can be wrapped by higher level APIs expanding its functionalities (for instance as GStreamer, MLT, FFmpeg and others do).

*Frei0r* has been developed with production video software in mind, not video players or desktop toys of sorts. For instance it can be used like GStreamer, but its different as it aims to be lighter, for instance allowing host application developers to avoid memcpy and other buffering operations. Also it doesn’t enforces dependency from GNOME and such desktop frameworks.

#### Etc.

## Working with Audio

This distribution is full with audio software to do all kind of things: electronic music, sound processing, voice effects, interviews and more. And there is one important thing that makes this system superior to any other commercial solution: there is no competition :)

Most of the audio applications in dynebolic can be connected together, input to output, in order to form a chain of tools processing the sound: this is done thanks to a technologies like Pipewire, JACK and the Advanced Linux Sound Architecture (ALSA). Instead of keeping separated the tasks of every single application, now it is possible to take advantage of the great variety of approaches that a GNU/Linux system like *dynebolic* has to offer.

*TIP: it happens often that line-out and headphones are inverted, so while Line-out could be selected it's actually outputting on the headphones, if there's no sound always double check this.

### Audio tools and programs

#### Audacity

*Audacity* is a user-friendly audio editing program suitable to manipulate your audio files, interviews and recordings, separating or mixing them, applying effects and encoding in various formats. It can also be used to record audio straight away via its intuitive interface, which can be commonly found also on other operating systems since it is a cross-platform free application. A perfect choice to start manipulating audio.

#### Ardour

*Ardour* is the fully featured multitrack studio that offers the most advanced interface for your music recording studio.  Combined together with other applications when necessary (it also uses Jack) it can really solve all your needs for audio mastering and music production. Check the online documentation for this valuable software on the [Ardour homepage](https://ardour.org): if you are a musician, the patience needed to learn it’s usage and hotkeys is definitely worth the effort.

#### Mixxx

*Mixxx* is currenly the most popular libre DJ Automation and digital DJ performance application. It includes many features common to digital DJ solutions as well as some unique ones: it natively supports advanced MIDI and HID DJ controllers, is licensed under the GPL-2.0-or-later and runs on all major desktop operating systems. The project was started in early 2001 for a doctoral thesis as one of the first digital DJing systems

<!-- #### Hydrogen -->

<!-- Hydrogen is a software synthesizer which can be used alone, emulating a drum machine based on patterns, or via an external MIDI keyboard/sequencer software. -->

<!-- #### Pure Data (?) -->

<!-- #### SuperCollider (?) -->

### Some technicalities

 - The low-latency question

### Audio servers

The zoo of Linux audio servers.

(Obligatory [XKCD 927](https://xkcd.com/927/) here.)

1.  The ALSA audio back-end.

2.  The JACK audio server

    Still going strong.

3.  Pulseaudio

    Explain why *Pulseaudio* is a Crime against Nature, and why "Poettering" is a gerund.

    (I honestly hope we won't have to deal with PA here.)

4.  The Pipewire audio server

    One media server to rule them all.

### Pipewire

Pipewire is the new sound and video layer in between the graphical desktop/the applications and the devices, offer so much more than pulseaudio beside an integration with libcam for all that has to do with webcams, video streaming, desktop sharing, ecc.
Pipewire also offer a simple utility called *pw-jack* that allows for jackd-only applications to run natively on top of pipewire. For example, lets open up a software called qpwgraph, and after that let's open Ardour in a terminal with the command *pw-jack ardour*, all ardour inputs and outputs will show in pipewire patchbay without a jackd daemon running.

## Streaming Media

Now that you have worked hard on your media, be it a podcast, experimental video, music, or sound art, you might feel the need to get it out there in the world. As far as streaming media goes, *dynebolic*'s Streaming Activity has you covered.

### OBS Studio

*OBS Studio* (the Open Broadcaster's Software Studio) is a free and open-source, cross-platform app for screencasting screencasting and live streaming. It is available for Linux and BSD distributions, as well as other operating systems. *OBS Studio* provides real-time capture, scene composition, recording, encoding, and broadcasting via Real-Time Messaging Protocol (RTMP), HLS, SRT, RIST or WebRTC. It can stream videos to any RTMP-supporting destination, including YouTube, Twitch, Instagram and Facebook

In recent years (and especially in the wake of the COVID-19 crisis), *OBS Studio* has become the most popular tool for countless podcasts, live streaming sessions, news broadcasts, or live coding. It can use any number of cameras and sound sources, and can be comfortably configured to stream any computer screen or program window we choose.

The first you'll start OBS it will guide you through some basic settings and wheter you want to record locally, stream online or both.
You will be greeted by a popup with the news of the latest updates, being a very active software, and the interface composed by the preview, the scene editor and selector, the sources editor and selector, the audio mixer, the transition selector and the controls.

In the scene selector we can create new scenes to wich add new sources, make it a background image, another audio source, a webcam, ecc, a live streamer for example would want and intro scene, with microfones shutoff, some news rolling, a count down and a shiny background animation, with a transparency transition of 3 second while switching to the second scene, in wich there could be a different setup of sources, the capturing of a program window or a game, a webcam, ecc; OBS also has full hotkeys support, so for activating and deactivating sources like microfones or camera without leaving your keyboard or using external usb deck devices. Once an optimal setup is found scene and sources can be locked and even copied/cloned.
In the case of live streaming you will have to tweak the bitrate based on your upload speed.

OBS has also an advanced interface with two preview screens that can be enabled in the preferences.

### BUTT

If our streaming project doesn't need all the power and features of OBS Studio, or we need to join a broadcast using an Icecast server, the ideal tool for the job is *BUTT*.

*Broadcast Using This Tool* (charmingly contracted to *BUTT*) is an easy to use, multi-OS streaming tool.
It supports SHOUTcast and Icecast and runs on Linux and other operating systems. The main purpose of BUTT is to stream live audio data from your computers mic or line input to a Shoutcast
or Icecast server. It also has facilities for recording our session.

One peculiarity of *BUTT* is that it is focused on live audio - that is, it will broadcast a microphone, instrument, or software synth source to the Icecast server's mount point, but it will not stream recorded media files. (But nothing stops you from using it to stream your DJ session with [Mixxx](#mixxx), for example.)

## Working With Graphic Design

### Inkscape

*Inkscape* is a free and open source vector graphics editor for GNU/Linux and other operating systems. It offers a rich set of features and is widely used for both artistic and technical illustrations such as cartoons, clip art, logos, typography, diagramming and flowcharting. It uses vector graphics to allow for sharp printouts and renderings at unlimited resolution and is not bound to a fixed number of pixels like raster graphics. *Inkscape* uses the standardized SVG file format as its main format, which is supported by many other applications including web browsers. It is an ideal tool for flyers, high-resolution prints and pre-flight DTP work.

### Krita

*Krita* is a free and open source cross-platform application that offers an end-to-end solution for creating digital art files from scratch. It is made by artists that want to see affordable art tools for everyone. *Krita* is optimized for frequent, prolonged and focused use. Explicitly supported fields of painting are illustrations, concept art, matte painting, textures, comics and animations. *Krita* supports open standards and interoperates with other applications.

Krita’s tools are developed keeping the above vision in mind. Although it has features that overlap with other raster editors its intended purpose is to provide robust tool for digital painting and creating artworks from scratch.

### Blender

*Blender* is the free and open source 3D creation suite. It supports the entirety of the 3D pipeline—modeling, rigging, animation, simulation, rendering, compositing and motion tracking, even video editing and game creation. Advanced users employ *Blender*’s API for Python scripting to customize the application and write specialized tools; often these are included in *Blender*’s future releases. *Blender* is well suited to individuals and small studios who benefit from its unified pipeline and responsive development process. Examples from many Blender-based projects are available in the showcase.

*Blender* is cross-platform and runs equally well on Linux and other operating systems. Its interface uses OpenGL to provide a consistent experience. To confirm specific compatibility, the list of supported platforms indicates those regularly tested by the development team.

Indeed, *Blender* is such a powerful and complex multimedia tool, that it fits equally well in the [Video](#working-with-video) and here in the [Graphic Design](#graphic-design) Activities of *dynebolic*.

## Working With Photography

Whether you just need to crop or apply an effect on a bitmap image, or you need to establish a good RAW development workflow, the Photography Activity has the tools for you.

### Gwenview

*Gwenview*, the KDE Plasma default image viewer, is a fast and lean tool for viewing images and browsing and annotating picture collections. It even offers some basic editing operations, such as image resizing and cropping, which make it very handy for moments when a heavier tool would be overkill.

### The GNU Image Manipulation Program

The *GNU Image Manipulation Program* is a well mature application capable to create and edit bitmap images, offers a perfect environment for web graphics as well a powerful script engine to automatize its operations and even generate automatically stylish logos.

### Darktable

*Darktable* is an open source photography workflow application and RAW developer. A virtual lighttable and darkroom for photographers. It manages your digital negatives in a database, lets you view them through a zoomable lighttable and enables you to develop RAW images and enhance them.

### digiKam

*digiKam* is an advanced open-source digital photo management application that runs on Linux and other operating systems. The application provides a comprehensive set of tools for importing, managing, editing, and sharing photos and raw files. While *digiKam* also has RAW development capabilities, its strong point is in library management and cataloging. It also has a useful set of plugins which enable direct publishing to online sites such as Flickr and others.

### The `lensfun` database


*Dynebolic* comes with enough powerful tools for digital photography to satisfy a photographer's needs. Nevertheless, an important step in setting up our digital photography workflow is updating the `lensfun` database. `lensfun` is an open, collaborative database of camera and lens profile, which are essential for RAW development operations, such as lens correction. If *Darktable* can't find the profile of your camera model or lens (or at least the closest possible one), chances are your `lensfun` database hasn't been updated.

To do this, we open *Konsole*, and do the following:

    > lensfun-update-data

And that's it. You won't need to do anything else - *Darktable* or other RAW processing tools will use the updated `lensfun` database in the background.

### Learn more

-   [The Darktable website](https://www.darktable.org/), and its [resources section](https://www.darktable.org/resources/)
-   [The digiKam website](https://www.digikam.org)
-   The `lensfun` [website](https://lensfun.github.io/), especially its [FAQ](https://lensfun.github.io/faq/)
-   [dstyle.net](https://dtstyle.net/), a huge collaborative collection of *Darktable* styles
-   [Pixls.us](https://pixls.us/), one of the greatest resources for libre digital photography. In particular, check out its [forums](https://discuss.pixls.us/)

## Publishing

Although nowadays most of what we call "publishing" happens online, we shouldn't underestimate the importance of print media for local grassroots organizations and activism. That flyer you posted on a local community cork board or left at your neighborhood coffee house might reach people your social media updates won't!

While flyers, brochures and leaflets can be produced with [Inkscape](#inkscape), *dynebolic* also provides [Scribus](#scribus), a full-fledged Desktop Publishing (DTP) environment.

### Writing Implements

Whatever you intend to publish, chances are that you'll need to write some copy. No matter what you intend to do with it, there's no avoiding some banging on a keyboard for a while.

For text- and document writing and editing, *dynebolic* includes *LibreOffice*, so you have the full feature set of an office suite.

If you prefer leaner writing tools, *dynebolic* also includes the *Kate* advanced text editor. And, if you're feeling particularly *1337*, at the command line you will find a recent version of the venerable *Vim* editor.

### Scribus

*Scribus* is a desktop publishing program to compose vectorial formats like PDF and Postscript, it is useful to paginate text in a professional printable form to produce magazines, flyers and most publications that need to mix text and images in pages following customizable schemes.

