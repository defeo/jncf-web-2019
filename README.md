# JNCF 2019 website

## Edit the webstie

The sources for the web pages are in the [`src`](src) folder, one
`.md` Markdown file per page.

The website is automatically updated after each edit. The status of
the current build is: [![click
here](https://api.travis-ci.org/defeo/jncf-web-2019.svg?branch=master)](https://travis-ci.org/defeo/jncf-web-2019#).

## Working locally

You can clone this repo and work locally on the website. To test the
website before pushing your changes, follow these steps.

### Prerequisites

You will need:

- A recent version of Node.js (tested with Node 9),
- To use the `make watch` command, which rebuilds the output at each
  file change, install inotify-tools.

### Install Node dependencies

To install the dependencies:

```
make install
```

### Build the website

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

### Deploy

To deploy, simply push your changes to the orginal repo.

Alternatively, if you have the password, you can run `make deploy`.

