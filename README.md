# gitbook

Markdown to web conversion server on node.js.

This container provides the gitbook node.js application.  The container
runs the 'build' command by default, but the user can provide either 
the 'init' or 'serve' on the docker command line.

## Dockerfile

This is a simple Dockerfile which uses the standard Node image to provide 
the gitbook utility.

## Usage

The server expects the tree containing the Markdown file(s) to be mapped 
into the /usr/src/app directory as per the standard node docker image.

    docker run -it --rm --name gitbook-docs -v "$PWD":/usr/src/app gitbook

To serve the web pages in the directories, add the "serve" option to the
docker command line.  The image exports port 4000, which is the port on
which the gitbook app serves the html:

    docker run -it --rm --name gitbook-docs -v "$PWD":/usr/src/app gitbook serve

If necessary, the /usr/src/app container directory can be changed via setting
the DOCROOT environment variable.
