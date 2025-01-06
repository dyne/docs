# cjit(1) - Just-In-Time interpreter for C

CJIT, January 2025

<pre><code>cjit [options] &lt;files&gt; [-- app arguments]
</synopsisFormatted>

<synopsisFormatted>
[options] are prefixed by single or double dash and may require an argument
</synopsisFormatted>

<synopsisFormatted>
&lt;files&gt; can be one or more paths to any source (.c), object (.o) or libs (dll, dylib, .so)
</synopsisFormatted>

<synopsisFormatted>
[-- app args] all arguments following a double dash are passed as-is to the running application</code></pre>


<a name="description"></a>

# Description

**CJIT**
is a lightweight C interpreter that lets you run C code
instantly, without needing to build it first. In addition to
just-in-time execution, it can do everything a C compiler does,
including call functions from any installed library, and generate
executables. It is also designed to be a drop-in replacement for gcc(1)
and clang(1) for instance using CC=cjit as environment setting.


<a name="options"></a>

# Options



* -h  
  Displays a summary of the command-line options available with \`cjit\`. It is useful for users who need a quick reference on how to use the tool. This manual is meant to complete that knowledge with more in-depth information.
  
* -v  
  Prints the version number of \`cjit\`. It's helpful for verifying the specific version you're working with, especially when troubleshooting or reporting issues: always include the version output. It can also be quickly added to any commandline combination to show the internal state of cjit, for instance include and library paths configured, cflags and libraries linked.
  
* -q  
  Suppresses all non-essential output, providing a quieter operation. Only critical errors are displayed. This option is turned on by default when CJIT is launched inside a script (no tty).
  
* -C _&lt;--various -C --flags&gt;_  
  Use this option to specify custom flags for the interpreter or compiler. If not set, \`cjit\` uses the flags defined in the environment variable \`CFLAGS\`.
  
* -c  
  Only compiles a single provided source file, without executing it, to produce an object file. This option will generate a new pre-compiled object file named like the given source, changing its extension from .c to .o, unless a new name is specified using _-o_.
  
* -o _&lt;filename&gt;_  
  Specifies a filename output. When included in a command-line it switches CJIT to _BUILD_ mode (see section below) and compiles all the source files into an executable but does not run the resulting program. You must provide the path for the output executable.
  
* -D _key[=value]_  
  Defines a "macro" key (and optionally its value) for the preprocessor, just like a _#define_ directive would do when included inside the source. You can specify a simple symbol or use \`key=value\` to define a macro with a specific value.
  
* -I _&lt;path&gt;_  
  Adds a directory path to the list of paths searched for header files. This is particularly useful if your project includes headers that are not in the standard system directories, for more information see the _PATHS_ section.
  
* -l _&lt;name&gt;_&gt;  
  Links a specific shared library. On Windows the name is that of a .DLL file without its extension. On UNIX systems (GNU/Linux and BSD) one needs to provide the name of the library without the \`lib\` prefix (e.g., use \`-lssl\` for \`libssl.so\`).
  
* -L _&lt;path&gt;_  
  Add a directory path to the library search paths. This is helpful when your project depends on libraries that are located in non-standard directories, for more information see the _PATHS_ section.
  
* -e _&lt;function&gt;_  
  Specifies a different entry function than the default \`main\` function. It is useful if your program has multiple potential entry points, of you want to try a different one ... at your own risk.
  
* -p _&lt;path&gt;_  
  Writes the process ID of the executing program to the specified file. This is useful for managing and monitoring the running process.
  
* --verb  
  Enables verbose logging, which provides more detailed information about the actions CJIT is performing. It's useful for debugging and understanding the compilation and execution process.
  
* --xass _[path]_  
  Extract runtime assets required by CJIT to run you program. If a path is specified, the assets are extracted to that location; otherwise, they are extracted to the default directory, which is located in _AppData\\Local\\Temp\\CJIT-vN.N.N_ on Windows and in _/tmp/cjit-vN.N.N_ on POSIX systems.
  
* --xtgz _&lt;path&gt;_  
  Extracts all files from a specified _USTAR_ format tar.gz archive. This is useful for setting up project dependencies or resources packaged in an archive, for instance is used to setup the _cjit-demo.tar.gz_ tutorial assets by the script found on _https://dyne.org/cjit/demo_.
  

<a name="author"></a>

# Author


This manual is Copyright (c) 2025 by the Dyne.org foundation

Written by Denis Roio &lt;_https://jaromil.dyne.org_&gt;


<a name="licensing"></a>

# Licensing


**CJIT**
is licensed under the GNU General Public License version 3 (GPLv3) or any later version published by the Free Software Foundation.
**The GPLv3 grants you 4 freedoms:**  
**- Use:**  
Just like anyone else, you may use this software for any purpose.  
**- Study and Modify:**  
You may study how CJIT works, and modify it to make it do what you wish.  
**- Distribute:**  
You may redistribute copies of CJIT so that others can benefit from it.  
**- Distribute Modified Versions:**  
You may distribute your modifications if you grant others the same freedom.

This is a human-readable summary of (and not a substitute for) the license. For the full text of the GPLv3 visit _https://www.gnu.org/licenses/gpl-3.0.html_. Components included in CJIT are copyright and licensed by their respective vendors, and all are compatible with the GPLv3: a list of component licenses is provided in CJIT's sourcecode inside the LICENSES/ folder and detailed by the REUSE.toml file.

This manpage is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License (CC BY-SA 4.0) or any later version. To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.


<a name="availability"></a>

# Availability


The most recent version of CJIT sourcecode and up to date
documentation is made available from its website on
_https://dyne.org/cjit_.


<a name="see-also"></a>

# See Also

**tcc**(1),

