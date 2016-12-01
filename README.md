# Watcher Docker Container

Docker container for [Watcher](https://github.com/nosmokingbandit/watcher) using a lightweight Fedora build. 

## Usage 

```bash
docker create -v /path/to/config/dir:/config
    -p 9090:9090 --name=Watcher 
```


