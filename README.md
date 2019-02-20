# Alpine with SSH and RSYNC

Image for testing purposes only, it's create an alpine linux with SSH and RSYNC support.

How to use this image
--------------------------------------------

1. Build with `docker build -t alpine-ssh .`
2. Start with `docker run -t -d -p 2222:22 -p 8733:873 alpine-ssh`
3. To check that your image is running try to access with ssh `ssh root@localhost -p 2222`
