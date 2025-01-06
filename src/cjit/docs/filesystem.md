
# CJIT built-in extensions

CJIT is equipped with a range of built-in extensions designed to
enhance the capabilities of your C scripts. These extensions allow you
to perform a variety of operations easily and efficiently, adding a
layer of versatility to your coding experience. Whether you're
manipulating data, handling complex computations, accessing 3D
acceleration or drawing on the terminal or monitoring filesystem
changes, our built-ins extensions provide additional function calls to
make your scripting both powerful and fun.

Our selection of extension is guided by a choice of minimalism and
portability. Below you'll see a list of what we ship and link to
respective vendors.

## Filesystem monitoring

The [dmon](https://github.com/septag/dmon/) built-in is designed for
monitoring changes in the filesystem. This extension simplifies the
process of tracking file modifications, deletions, and creations,
allowing you to respond to these events in real time within your C
scripts.

Here and in
[examples/dmon.c](https://github.com/dyne/cjit/blob/main/examples/dmon.c)
is some example code working on all platforms:

```c
#include <stdio.h>
#include <dmon.h>

static void watch_callback(dmon_watch_id watch_id,
                           dmon_action action,
                           const char* rootdir,
                           const char* filepath,
                           const char* oldfilepath,
                           void* user) {
    (void)(user);
    (void)(watch_id);
    switch (action) {
    case DMON_ACTION_CREATE:
        fprintf(stderr,"CREATE: [%s]%s\n", rootdir, filepath);
        break;
    case DMON_ACTION_DELETE:
        fprintf(stderr,"DELETE: [%s]%s\n", rootdir, filepath);
        break;
    case DMON_ACTION_MODIFY:
        fprintf(stderr,"MODIFY: [%s]%s\n", rootdir, filepath);
        break;
    case DMON_ACTION_MOVE:
        fprintf(stderr,"MOVE: [%s]%s -> [%s]%s\n",
          rootdir, oldfilepath, rootdir, filepath);
        break;
    }
}

int main(int argc, char* argv[]) {
    if (argc > 1) {
        dmon_init();
        puts("waiting for changes ..");
        dmon_watch(argv[1], watch_callback,
          DMON_WATCHFLAGS_RECURSIVE, NULL);
        getchar();
        dmon_deinit();
    } else {
        puts("usage: test dirname");
    }
    return 0;
}
```

## Audio play and record

The [miniaudio](https://miniaud.io) built-in handles audio playback
and capture with ease. With this extension, you can seamlessly
integrate audio functionality into your C scripts, creating immersive
and interactive experiences for your users.

Miniaudio provides two main sources of documentation

  - [The miniaudio Programmer's manual](https://miniaud.io/docs/manual/index.html)
  - [Various miniaudio examples](https://miniaud.io/docs/examples/index.html)

Miniaudio includes both low level and high level APIs. The low level
API is good for those who want to do all of their mixing themselves
and only require a light weight interface to the underlying audio
device. The high level API is good for those who have complex mixing
and effect requirements.

In miniaudio, objects are transparent structures. Unlike many other
libraries, there are no handles to opaque objects which means you need
to allocate memory for objects yourself.

A config/init pattern is used throughout the entire library. The idea
is that you set up a config object and pass that into the
initialization routine. The advantage to this system is that the
config object can be initialized with logical defaults and new
properties added to it without breaking the API.

Below and in
[examples/miniaudio.c](https://github.com/dyne/cjit/blob/main/examples/miniaudio.c)
is an example of sin wave synthesis that runs smoothly in CJIT:

```c
#define MA_NO_DECODING
#define MA_NO_ENCODING
#define MINIAUDIO_IMPLEMENTATION
#include <miniaudio.h>
#include <stdio.h>
#define DEVICE_FORMAT       ma_format_f32
#define DEVICE_CHANNELS     2
#define DEVICE_SAMPLE_RATE  48000

void data_callback(ma_device* pDevice,
                   void* pOutput,
                   const void* pInput,
                   ma_uint32 frameCount) {
    ma_waveform* pSineWave;
    MA_ASSERT(pDevice->playback.channels == DEVICE_CHANNELS);
    pSineWave = (ma_waveform*)pDevice->pUserData;
    MA_ASSERT(pSineWave != NULL);
    ma_waveform_read_pcm_frames(pSineWave, pOutput, frameCount, NULL);
    (void)pInput;   /* Unused in this example. */
}

int main(int argc, char** argv) {
    ma_waveform sineWave;
    ma_device_config deviceConfig;
    ma_device device;
    ma_waveform_config sineWaveConfig;
    deviceConfig = ma_device_config_init(ma_device_type_playback);
    deviceConfig.playback.format   = DEVICE_FORMAT;
    deviceConfig.playback.channels = DEVICE_CHANNELS;
    deviceConfig.sampleRate        = DEVICE_SAMPLE_RATE;
    deviceConfig.dataCallback      = data_callback;
    deviceConfig.pUserData         = &sineWave;
    if (ma_device_init(NULL, &deviceConfig, &device) != MA_SUCCESS) {
        printf("Failed to open playback device.\n");
        return -4;
    }
    printf("Device Name: %s\n", device.playback.name);
    sineWaveConfig = ma_waveform_config_init(device.playback.format,
                                             device.playback.channels,
                                             device.sampleRate,
                                             ma_waveform_type_sine,
                                             0.2, 220);
    ma_waveform_init(&sineWaveConfig, &sineWave);
    if (ma_device_start(&device) != MA_SUCCESS) {
        printf("Failed to start playback device.\n");
        ma_device_uninit(&device);
        return -5;
    }
    printf("Press Enter to quit...\n");
    getchar();
    ma_device_uninit(&device);
    (void)argc;
    (void)argv;
    return 0;
}
```

## Terminal User Interface

Believe it or not, one can draw a beautiful terminal user interface
(also called TUI) on a text console, with colors and blinking lights
too. Our built-in [termbox2](https://github.com/termbox/termbox2)
allows this in an API that improves a lot on old approaches as ncurses
or slang, by [sucking much less](https://suckless.org) `:^)`

Here is a quick synopsis:

```c
#define TB_IMPL
#include "termbox2.h"

int main(int argc, char **argv) {
    struct tb_event ev;
    int y = 0;

    tb_init();

    tb_printf(0, y++, TB_GREEN, 0, "hello from termbox");
    tb_printf(0, y++, 0, 0, "width=%d height=%d",
              tb_width(), tb_height());
    tb_printf(0, y++, 0, 0, "press any key...");
    tb_present();

    tb_poll_event(&ev);

    y++;
    tb_printf(0, y++, 0, 0, "event type=%d key=%d ch=%c",
              ev.type, ev.key, ev.ch);
    tb_printf(0, y++, 0, 0, "press any key to quit...");
    tb_present();

    tb_poll_event(&ev);
    tb_shutdown();

    return 0;
}
```

The termbox2 basic API is self explanatory:

```c
int tb_init();
int tb_shutdown();

int tb_width();
int tb_height();

int tb_clear();
int tb_present();

int tb_set_cursor(int cx, int cy);
int tb_hide_cursor();

int tb_set_cell(int x, int y, uint32_t ch,
                uintattr_t fg, uintattr_t bg);

int tb_peek_event(struct tb_event *event,
                  int timeout_ms);
int tb_poll_event(struct tb_event *event);

int tb_print(int x, int y,
             uintattr_t fg, uintattr_t bg,
             const char *str);
int tb_printf(int x, int y,
              uintattr_t fg, uintattr_t bg,
              const char *fmt, ...);
```

To see a demo of what it can do, see the
[examples/termbox.c](https://github.com/dyne/cjit/blob/main/examples/termbox2.c)
example which will draw a keyboard on your terminal and show the keys
you are pressing in real-time. Its code is a great source of knowledge
about what termbox2 can do!
