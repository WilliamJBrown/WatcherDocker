# Fedora NZBHydra Docker Container

Docker container for [NZBHydra](https://github.com/theotherp/nzbhydra) using Fedora.

## Usage

Create with defaults:

```bash
docker create -v /path/to/config/dir:/config \
    -v /etc/localtime:/etc/localtime:ro \
    -p 5075:5075 --name=nzbhydra mattsch/fedora-nzbhydra
```

Create with a custom uid/gid for the nzbhydra daemon:

```bash
docker create -v /path/to/config/dir:/config \
    -v /etc/localtime:/etc/localtime:ro \
    -e LUID=1234 -e LGID=1234 \
    -p 5075:5075 --name=nzbhydra mattsch/fedora-nzbhydra
```
