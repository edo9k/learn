sudo su
docker run --rm --privileged    \
  --interactive --tty           \
  --volume "$(pwd):/src"        \
  --workdir "/src"              \
  swift:latest

