
# CJIT for graphical applications

Be welcome to the exciting world of graphical C applications using SDL
([Simple DirectMedia Layer](https://sdl.org)). SDL, originally
developed by Sam Lantinga in 1998, is a powerful, cross-platform
library designed to provide low-level access to audio, keyboard,
mouse, and graphics hardware via OpenGL and Direct3D. It is an ideal
choice of free and open source library to create graphical
applications that run seamlessly across different operating systems.

Whether you're developing games, simulations, or interactive tools,
the combination of CJIT's simplicity in C code execution and [SDL's
cross-platform
capabilities](https://wiki.libsdl.org/SDL2/Installation) offers a
robust solution for your graphical application needs.

As in the previous chapter, the following sections will guide you
through practical usage examples, demonstrating how to create
graphical applications. 🌟📚

## The Beauty of Random

First download SDL2 for your platform from their [official release page](https://github.com/libsdl-org/SDL/releases):

=== "MS/Windows"
    ```
    Invoke-WebRequest -Uri https://github.com/libsdl-org/SDL/releases/download/release-2.30.9/SDL2-devel-2.30.9-VC.zip
    ```

=== "Apple/OSX"
    ```
    brew install sdl2
    ```

=== "GNU/Linux"
    ```
    sudo apt-get install libsdl2-dev
    ```

In case of Windows you need to decompress the zip file to a known location, the important folders are called `lib` and `include`.

Then download the `sdl2_noise.c` example:

=== "MS/Windows"

    ```
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/dyne/cjit/refs/heads/main/examples/sdl2_noise.c" -OutFile "sdl2_noise.c"
    ```

=== "Apple/OSX"

    ```
    curl -sLo sdl2_noise.c https://raw.githubusercontent.com/dyne/cjit/refs/heads/main/examples/sdl2_noise.c
    ```

=== "GNU/Linux"

    ```
    curl -sLo sdl2_noise.c https://raw.githubusercontent.com/dyne/cjit/refs/heads/main/examples/sdl2_noise.c
    ```

Then as usual execute it passing the source file as argument to CJIT.

!!! info
    The preview below looks bad because video compression cannot deal well with randomness.

![A lousy rendering quality of random pixels](images/cjit_sdl2_noise.gif)

!!! warning
    This example still doesn't run on Windows, we are working on it.

Now have a look inside `sdl2_noise.c` and at the beginning of the file you'll see some particular lines of code:

### The "hashbang"
```sh
#!/usr/bin/env cjit
```

This line indicates that the source file is a script that can be executed using the `cjit` interpreter when the executable bit is enabled (`chmod +x`) and if the CJIT interpreter is found in PATH.

### The pragma lib
```c
#pragma comment(lib, "SDL2")
```

This line tells CJIT to use the `libSDL2.so` shared library found installed on the system and allow the source code to call functions provided by it. It is the equivaled of `-lSDL2` on the commandline, with the only difference that it can be specified inside the source code.

### The SDL2 fix

```c
#define SDL_DISABLE_IMMINTRIN_H 1
```

This line tells SDL to disable some machine specific modules that break CJIT execution. Without it any SDL2 application will crash.

!!! warning
    Work in Progress! If you like, contribute to [Dyne.org manuals](https://github.com/dyne/docs)
