# SIKE submission website

## Prerequisites

To build the website, you need a recent version of Node.js. Installing
inotify-tools may help developing the website.

## Install

To install the dependencies:

```
make install
```

To build the website:

```
make
```

the website will be built inside the `build` folder.

To keep rebuilding the website each time a file changes, if you have
inotify-tools installed:

```
make watch
```
