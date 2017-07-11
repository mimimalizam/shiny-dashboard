README
=========

This repo is intended to let me play around with Shiny

Dataset
---------

Run RStudio in Docker
---------------------

From the comfort of your terminal run

```
$ docker build -t shiny-dashboards .
```

An instance of an **image** is called **container**.
An image is the setup of the isolated environment.
If you run this image, you will have an instance of it, which we call containter.
You can have many running containers of the same image.

```
$ docker run --rm -p 9923:9923 mimimum/shiny-dashboards
```

It will be avaliable at `http://localhost:9923`.

`-p` tells Docker that you will be using a port to see RStudio in your web browser
(at a location which we specify afterwards as port 9923:9923).
`--rm` ensures that when we quit the container, the container is deleted.

When you visit `http://localhost:9923` you will be greeted by the RStudio welcome screen.

Log in credentials are:

```
 username: rstudio
 password: rstudio
```

Dockerfile
----------

The image is built by running `docker build -t my-r-image .` in the same
directory as our Dockerfile. It helps us to re-create our images at will.
Here are some main commands

- `FROM` - can be found at the beginning of every Dockerfile and specifies
the image we want to start from
- `RUN` - runs shell commands on top of our base image. Can be used for downloads
and installations
- `ADD` - adds files from our computer (host) to a Docker images which it is describing.

Manipulating with files between host and container
-------------------------------------------------

If we have a running container and we want to add some files to it,
we'd use a command similar to the following

```
$ docker cp $HOME/shiny-dash-1/sample-app <containter-id>:home/rstudio/sample-app
```

Similarly, with the following command we can copy files from running container

```
# copy from contrainer
$ docker cp <container_id>:/file/path/within/container /host/path/target
```

RStudio Server
--------------

By default RStudio accepts connections on port 8787.
In this case Docker will be using port 9923,
as it is stated in `config/rserver.conf`.

Getting started with dashing
----------------------------

When you have running a Docker container, and you have opened `http://localhost:9923`,
you can create a dashboard. For example, by following [shinydashboard tutorial].

Trivia
------
***9923*** = 38 * 256 + 195 is the smallest [executable prime] on an x86 DOS.
To learn more about this refer to Phill Carmody's article about [illegal numbers]
or watch [Numberphile's video].


Dashboard is an app that
------------------------

- is always available
- displays key information
- typically refreshes automatically or on a schedule
- may or may not be interactive

1. How to automatically update your dashboard with new data

- reactiveFileReader function
- reactivePoll function

2. How to build a great dashboard UI

- shinydashboard package
- htmlTemplate function

[executable prime]: http://primes.utm.edu/glossary/page.php?sort=ExecutablePrime
[Illegal numbers]: http://fatphil.org/maths/illegal.html
[Numberphile's video]: https://www.youtube.com/watch?v=wo19Y4tw0l8
[shinydashboard tutorial]: https://rstudio.github.io/shinydashboard/get_started.html
