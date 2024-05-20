# FacebookExpandAll

Fork of Jens Farley's Expand All bookmarklet for modernization &amp; resumed development

## Installing

To install this bookmarklet, create a bookmark (you can name it whatever you want, I use "Expand All (Facebook)"), and then paste the entire contents of the `ExpandAll-bookmarklet.js` build output file into its URL field.

You can also use `ExpandAll-bookmarklet-debug.js`, which preserves the names of symbols and thus can sometimes make debugging easier.

## Using

In an open Facebook tab showing the comment thread in question, click on the bookmark created during installation. This should temporarily pop up a small blue overlay that provides a running status update as to what it is doing. When it has finished, the overlay disappears after a short delay.

## Building

The source code in the repository is fully-expanded for ease of reading & manipulation, but this would result in an exceedingly large bookmarklet URL. As such, the project is supplied with a `Makefile` which uses `uglify-js` to minify & compress the code as much as possible, turning it into a single line in the process.

This `Makefile` is designed for use on UNIX-type systems. I have been using it on an Ubuntu 24.04 installation.

### Prerequisites

The build process defined here requires the following build environment tools:

* `make`: As provided by `apt install make` on Ubuntu 24.04 LTS (automatically installed).
* `uglifyjs`: As provided by `apt install uglifyjs` on Ubuntu 24.04 LTS.
* `xclip`: As provided by `apt install xclip` on Ubuntu 24.04 LTS.

### `Makefile` Targets

1. Basic build:
    ```
    make
    ```
    This produces a file ExpandAll-bookmarklet.js in the current directory.

2. Debug build (skips minification, so that symbols have their full names -- resulting code is is about 40% larger):
    ```
    make debug
    ```
    This produces a file `ExpandAll-bookmarklet-debug.js` in the current directory.

3. Send to clipboard
    ```
    make clipboard
    make debug-clipboard
    ```
    This runs the standard build process, and then automatically sends the file contents to the X clipboard.

4. Clean previous build output
    ```
    make clean
    ```

## Contributing

Feel free to fork this repository and make pull requests. Please explain your changes, and also please test them and provide test instructions in the PR if you want them to be considered.

Your changes will be subsumed into the MIT license for the project.
