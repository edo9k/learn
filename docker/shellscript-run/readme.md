# Shellscript testing POC 

This container installs several shellscript interpreters on a latest Ubuntu
image. 

To build the container with podman 

```
podman build . -t shell

```

To run a command into the latest ksh/zsh/csh/posh/fish/bash/dash verions

```
podman run --rm -e command=echo 1 + 1 = $(( 1 + 1 )) localhost/shell:latest

```

