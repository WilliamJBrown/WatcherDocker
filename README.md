# Watcher Docker Container

Docker container for [Watcher](https://github.com/nosmokingbandit/watcher) using a lightweight Fedora build.

Watcher is an automated movie NZB searcher and snatcher. You can add a list of wanted movies and Watcher will automatically send the NZB to Sabnzbd or NZBGet. Watcher also has basic post-processing capabilities such as renaming and moving.

Watcher is a work in progress and plans to add more features in the future, but we will always prioritize speed and stability over features.


## Usage 

```bash
docker create 
-v /path/to/config/dir:/config
-v /path/to/log/dir:/log
-v /path/to/movie/dir:/movie
-v /path/to/database:/database
-v /path/to/download/dir:/download
-e LUID=1234 -e LGID=1234
    -p 9090:9090 --name=Watcher 
```


Due Note: The download directory needs to be the full path that your downloader (SabNZB or NZBGet) passes to the renamer to tell it where the file is located. 

Example: I use nzbget and when a movie is finished it says where the file is located so Watcher can take that and move it. 

"path": "/volume2/Storage/NZBGet/Watcher/MOVIENAME 

That is what NZBGet reports to Watcher. So for our config when settings up docker we need to use

-v /Storage/NZBGet/Watcher:/volume2/Storage/NZBGet/Watcher

This way when Watcher gets told the directory, docker will mount the same pathing for Watcher to access the files. 


# Accessing the web-ui

If you wish to access the web-ui from a different computer. You will need to start the docker container and then shut it down. This will create a config file in your config path that you listed. 

-v /path/to/config/dir:/config

You will need to edit this file manually to allow other computers on the network to access the web-ui. You will want the change the serverhost value. eg:

serverhost = 127.0.0.1

change that to 

serverhost = 0.0.0.0

This way any computer can access the docker container. This is done to prevent the app to be accessed from other computers by default. If you do change this setting to let other computers access the web-ui make sure to enable the password-protect web-ui in the server settings. 


# Post-processing Scripts

You will have to manually download the post processing scripts from:
https://github.com/nosmokingbandit/watcher

You can locate the scripts in the [post scripts](https://github.com/nosmokingbandit/watcher/tree/master/post%20scripts) folder. 


From there you will have to take the NZBGet or Sabnzb scripts and put them in your appropriate install directory for your choice of downloader. 


