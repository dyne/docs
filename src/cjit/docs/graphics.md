
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

For more details on using OpenGL and SDL2 in C with shaders, read the
[multi-platform-modern-opengl-demo-with-sdl2
tutorial](https://shallowbrooksoftware.com/posts/a-multi-platform-modern-opengl-demo-with-sdl2/)
on which our example code is based.

## Nuklear widgets

Nuklear is a minimal, immediate-mode graphical user interface toolkit
written in ANSI C and licensed under public domain. It is designed to
be lightweight and highly customizable, and provides a wide range of
components, including buttons, sliders, text input fields, and more,
all of which can be integrated seamlessly with CJIT.

This time the code of our example is distributed across multiple files, this is a quick overview of what is found inside the `example` folder:
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

The main code of our example
is
[examples/nuklear.c](https://github.com/dyne/cjit/blob/main/examples/nuklear.c) and by default it will just start all modules.

Fire it up as usual with `./cjit.exe examples/nuklear.c` or equivalent commands on GNU/Linux and Apple/OSX.

And 💥Boom! enjoy Nuklear!

![Pretty advanced GUI widgets shown](images/cjit_nuklear.gif)

## That's all for now!

If you like this manual, [give CJIt a star](https://github.com/dyne/cjit), [let us know](https://dyne.org/contact) what you'd like to see next and consider making a [donation to Dyne.org](https://dyne.org/donate). Thanks!
