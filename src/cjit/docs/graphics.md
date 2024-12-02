
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
solution for your graphical application needs.

As in the previous chapter, the following sections will guide you
through practical usage examples, demonstrating how to create
graphical applications. 🌟📚

## The Beauty of Random

First download SDL for your platform. In Windows we download and extract a zip archive, on other system we install the latest SDL from package managers.


=== "MS/Windows"
    ```
    Invoke-WebRequest -Outfile SDL2-devel.zip -Uri https://github.com/libsdl-org/SDL/releases/download/release-2.30.9/SDL2-devel-2.30.9-mingw.zip
    unzip SDL2-devel.zip
    ```

=== "Apple/OSX"
    ```
    brew install sdl2
    ```

=== "GNU/Linux"
    ```
    sudo apt-get install libsdl2-dev
    ```

Then download the [sdl2_noise.c](https://github.com/dyne/cjit/blob/main/examples/sdl2_noise.c) example:

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

Then as usual execute it passing the source file as argument to CJIT. Since we are calling functions shared by a library, we'll add some extra parameters:

=== "MS/Windows"

    ```
    .\cjit.exe .\sdl2_noise.c -I.\SDL2-2.30.9\x86_64-w64-mingw32\include\ -L.\SDL2-2.30.9\x86_64-w64-mingw32\bin\
    ```

=== "Apple/OSX"

    ```
    ./cjit ./sdl2_noise.c -lSDL2
    ```

=== "GNU/Linux"

    ```
    ./cjit ./sdl2_noise.c -lSDL2
    ```


![A lousy rendering quality of random pixels](images/cjit_sdl2_noise.gif)

!!! info
    This preview looks blurred because video compression cannot deal well with randomness.

Have a look inside [sdl2_noise.c](https://github.com/dyne/cjit/blob/main/examples/sdl2_noise.c), and at the beginning of the file you'll see some particular lines of code worth explaining:

### The "hashbang"
```sh
#!/usr/bin/env cjit
```

This line indicates that the source file is a script that can be executed using the `cjit` interpreter when the executable bit is enabled and if the CJIT interpreter is found in PATH.

!!! warning
    The hashbang works only on Apple/OSX and GNU/Linux, where any file can be made executable with `chmod +x`

### The pragma lib
```c
#pragma comment(lib, "SDL2")
```

This line tells CJIT to link the `SDL2` shared library (the one installed on the system or found inside an `-L` path) and allows the source code to call functions provided by it. It is the equivaled of `-lSDL2` on the commandline, with the only difference that it can be specified inside the source code.

!!! info
    For Windows this means to look for `SDL2.dll` in a path indicated by `-L`. Another way to link libraries in Windows is to copy the `dll` files inside the same folder of the source code and add their filename to the list of arguments.

### The SDL2 fix

```c
#define SDL_DISABLE_IMMINTRIN_H 1
#define SDL_MAIN_HANDLED 1
```

These lines tell SDL to disable some functionalities that break CJIT's execution. Without them defined before the `#include <SDL2/SDL.h>` line Windows applications will crash.
