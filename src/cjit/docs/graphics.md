
# CJIT for graphical applications

Be welcome to the exciting world of graphical C applications using SDL
([Simple DirectMedia Layer](https://sdl.org)). SDL, originally
developed by Sam Lantinga in 1998, is a powerful, cross-platform
library designed to provide low-level access to audio, keyboard,
mouse, and graphics hardware via OpenGL and Direct3D.

!!! warn
    This part of the tutorial may be incomplete for Apple/OSX, please help testing and refining it!

## Download the cjit-demo package

From now on this tutorial will guide you to launch more complex
applications, showing how to use libraries that are installed on your
system and shipped along with the source code.

To setup the demo environment you can simply run the command below:

=== "MS/Windows"

    ```
    iex ((New-Object System.Net.WebClient).DownloadString('https://dyne.org/cjit/demo'))
    ```

=== "Apple/OSX"

    ```
    curl -sL https://dyne.org/cjit/demo.sh | bash
    ```

=== "GNU/Linux"

    ```
    curl -sL https://dyne.org/cjit/demo.sh | bash
    ```


## The Beauty of Random

Execute `sdl2_noise.c` passing the source file as argument to CJIT. Since we are also using a library, there may be the need for some extra parameters:

=== "MS/Windows"

    ```
    .\cjit.exe sdl2_noise.c SDL2.dll
    ```

=== "Apple/OSX"

    ```
    ./cjit ./sdl2_noise.c -lSDL2
    ```

=== "GNU/Linux"

    ```
    ./cjit ./sdl2_noise.c /usr/lib/x86_64-linux-gnu/libSDL2.so
    ```


![A lousy rendering quality of random pixels](images/cjit_sdl2_noise.gif)

!!! info
    This preview looks blurred because video compression cannot deal well with randomness.

Have a look inside [sdl2_noise.c](https://github.com/dyne/cjit/blob/main/examples/sdl2_noise.c), and see the first line of code:

### The "hashbang"
```sh
#!/usr/bin/env cjit
```

The source file can be launched as a script, when the CJIT interpreter is found in PATH.

!!! warning
    The hashbang works only on Apple/OSX and GNU/Linux, where scripts can be made executable with `chmod +x`

### The pragma lib

Also see this pre-processor directive:
```c
#pragma comment(lib, "SDL2")
```

This line tells CJIT to link the `SDL2` shared library. It is the equivaled of `SDL2.dll` on the commandline, with the only difference that it can be specified inside the source code.

!!! info
    On Windows the DLL files need to be in the same directory of execution, or installed system-wide.

## Three Dimensions

To draw accelerated graphics and 3D objects we'll use OpenGL libraries, which need to be installed on the system.

=== "MS/Windows"
    [Install the Windows SDK](https://developer.microsoft.com/en-us/windows/downloads/windows-sdk/) which is distributed gratis by Microsoft.

=== "Apple/OSX"
    Not sure (help testing this please!)

=== "GNU/Linux"
    ```
    sudo apt-get install libopengl-dev
    ```

Then run CJIT passing `examples/opengl.c` as argument.

![Smoothly rotating red square](images/cjit_opengl.gif)

Let's have a quick look at what is happening here: please note the `-DWINDOWS` execution flag we use for Windows. Then look at the `opengl.c` code:

```c
// Taken from https://github.com/theandrew168/sdl2-opengl-demo
//
// Copyright (c) 2020 Andrew Dailey
//
// Slightly modified to be one-file and work in CJIT by Jaromil
//
// MIT License
//
// Tutorial explanation:
// https://shallowbrooksoftware.com/posts/a-multi-platform-modern-opengl-demo-with-sdl2/

#pragma comment(lib, "SDL2")

#ifdef WINDOWS
#pragma comment(lib, "opengl32")
#elif LINUX
#pragma comment(lib, "OpenGL")
#else
#pragma comment(lib, "OpenGL")
#endif
```

Below the well deserved credits for this example there are different ways to link the OpenGL library, because the library file is named differently on different platforms. We solve the problem by using a `#define` macro with symbol `WINDOWS` to branch over a different `#pragma` directive chosing the case-sensitive name of the library.

To understand the rest of the code make sure to read the [multi-platform-modern-opengl-demo-with-sdl2 tutorial](https://shallowbrooksoftware.com/posts/a-multi-platform-modern-opengl-demo-with-sdl2/).

## Nuklear widgets

Nuklear is a minimal, immediate-mode graphical user interface toolkit
written in ANSI C and licensed under public domain. It is designed to
be lightweight and highly customizable, making it an ideal choice for
developing user interfaces across different platforms.

With Nuklear, you can easily create a comprehensive set of widgets to
enhance user experience (UX) in your applications. The library
provides a wide range of components, including buttons, sliders, text
input fields, and more, all of which can be integrated seamlessly with
CJIT. This combination allows for rapid prototyping and real-time
adjustments, fostering a dynamic development process.

Nuklear's simplicity and flexibility make it the perfect companion for
CJIT, enabling you to design and implement intuitive and visually
appealing interfaces that run consistently on GNU/Linux, MS/Windows,
and Apple/OSX.

Let's dive in and discover how to create powerful and responsive
interfaces with ease! 🎨🛠️

The
[nuklear.h](https://raw.githubusercontent.com/Immediate-Mode-UI/Nuklear/refs/heads/master/nuklear.h)
header is all what you need, download it together with CJIT's example
source code.

=== "MS/Windows"
    ```
    Invoke-WebRequest -OutFile "nuklear.h" -Uri "https://raw.githubusercontent.com/Immediate-Mode-UI/Nuklear/refs/heads/master/nuklear.h" -Encoding ASCII
    Invoke-WebRequest -OutFile "nuklear.c" -Uri "https://raw.githubusercontent.com/dyne/cjit/refs/heads/main/examples/nuklear.c" -Encoding ASCII
    mkdir nuklear
    Invoke-WebRequest -OutFile "nuklear/calculator.c" -Uri "https://raw.githubusercontent.com/dyne/cjit/refs/heads/main/examples/nuklear/calculator.c" -Encoding ASCII
    Invoke-WebRequest -OutFile "nuklear/canvas.c" -Uri "https://raw.githubusercontent.com/dyne/cjit/refs/heads/main/examples/nuklear/canvas.c" -Encoding ASCII
    Invoke-WebRequest -OutFile "nuklear/node_editor.c" -Uri "https://raw.githubusercontent.com/dyne/cjit/refs/heads/main/examples/nuklear/node_editor.c" -Encoding ASCII
    Invoke-WebRequest -OutFile "nuklear/overview.c" -Uri "https://raw.githubusercontent.com/dyne/cjit/refs/heads/main/examples/nuklear/overview.c" -Encoding ASCII
    Invoke-WebRequest -OutFile "nuklear/style.c" -Uri "https://raw.githubusercontent.com/dyne/cjit/refs/heads/main/examples/nuklear/style.c" -Encoding ASCII
    ```

=== "Apple/OSX"
    ```
    curl -sLo nuklear.h https://raw.githubusercontent.com/Immediate-Mode-UI/Nuklear/refs/heads/master/nuklear.h
    curl -sLo nuklear.c https://raw.githubusercontent.com/dyne/cjit/refs/heads/main/examples/nuklear.c
    mkdir -p nuklear
    curl -sLo nuklear/calculator.c https://raw.githubusercontent.com/dyne/cjit/refs/heads/main/examples/nuklear/calculator.c
    curl -sLo nuklear/canvas.c https://raw.githubusercontent.com/dyne/cjit/refs/heads/main/examples/nuklear/canvas.c
    curl -sLo nuklear/node_editor.c https://raw.githubusercontent.com/dyne/cjit/refs/heads/main/examples/nuklear/node_editor.c
    curl -sLo nuklear/overview.c https://raw.githubusercontent.com/dyne/cjit/refs/heads/main/examples/nuklear/overview.c
    curl -sLo nuklear/style.c https://raw.githubusercontent.com/dyne/cjit/refs/heads/main/examples/nuklear/style.c
    ```

=== "GNU/Linux"
    ```
    curl -sLo nuklear.h https://raw.githubusercontent.com/Immediate-Mode-UI/Nuklear/refs/heads/master/nuklear.h
    curl -sLo nuklear.c https://raw.githubusercontent.com/dyne/cjit/refs/heads/main/examples/nuklear.c
    mkdir -p nuklear
    curl -sLo nuklear/calculator.c https://raw.githubusercontent.com/dyne/cjit/refs/heads/main/examples/nuklear/calculator.c
    curl -sLo nuklear/canvas.c https://raw.githubusercontent.com/dyne/cjit/refs/heads/main/examples/nuklear/canvas.c
    curl -sLo nuklear/node_editor.c https://raw.githubusercontent.com/dyne/cjit/refs/heads/main/examples/nuklear/node_editor.c
    curl -sLo nuklear/overview.c https://raw.githubusercontent.com/dyne/cjit/refs/heads/main/examples/nuklear/overview.c
    curl -sLo nuklear/style.c https://raw.githubusercontent.com/dyne/cjit/refs/heads/main/examples/nuklear/style.c
    ```

This will create a small directory structure with all the source code files needed for our example:
```
.
├── nuklear
│   ├── calculator.c
│   ├── canvas.c
│   ├── node_editor.c
│   ├── overview.c
│   └── style.c
├── nuklear.c
└── nuklear.h
```

In this multiple file setup we have the main code of our example which
is
[nuklear.c](https://github.com/dyne/cjit/blob/main/examples/nuklear.c)
 call one or more example modules according to define flags. By default it will just start all modules, see around line 390:
```c
/* ===============================================================
 *
 *                          EXAMPLE
 *
 * ===============================================================*/
/* This are some code examples to provide a small overview of what can be
 * done with this library. To try out an example uncomment the defines */
#define INCLUDE_ALL
/*#define INCLUDE_STYLE */
/*#define INCLUDE_CALCULATOR */
/*#define INCLUDE_CANVAS */
#define INCLUDE_OVERVIEW
/*#define INCLUDE_NODE_EDITOR */

#ifdef INCLUDE_ALL
  #define INCLUDE_STYLE
  #define INCLUDE_CALCULATOR
  #define INCLUDE_CANVAS
  #define INCLUDE_OVERVIEW
  #define INCLUDE_NODE_EDITOR
#endif

#ifdef INCLUDE_STYLE
  #include "nuklear/style.c"
#endif
#ifdef INCLUDE_CALCULATOR
  #include "nuklear/calculator.c"
#endif
#ifdef INCLUDE_CANVAS
  #include "nuklear/canvas.c"
#endif
#ifdef INCLUDE_OVERVIEW
  #include "nuklear/overview.c"
#endif
#ifdef INCLUDE_NODE_EDITOR
  #include "nuklear/node_editor.c"
#endif

```

Starting it up is simple as usual, this time we just need to add `-I.` to tell CJIT it can look for headers in the current directory, so it will find `nuklear.h`

=== "MS/Windows"
    ```
    .\cjit.exe ./nuklear.c -I. -I.\SDL2-2.30.9\x86_64-w64-mingw32\include\ -L.\SDL2-2.30.9\x86_64-w64-mingw32\bin
    ```

=== "Apple/OSX"
    ```
    ./cjit ./nuklear.c -I.
    ```

=== "GNU/Linux"
    ```
    ./cjit ./nuklear.c -I.
    ```

And 💥Boom! enjoy Nuklear!

![Pretty advanced GUI widgets shown](images/cjit_nuklear.gif)

## That's all for now!

If you like this manual, [give CJIt a star](https://github.com/dyne/cjit), [let us know](https://dyne.org/contact) what you'd like to see next and consider making a [donation to Dyne.org](https://dyne.org/donate). Thanks!
