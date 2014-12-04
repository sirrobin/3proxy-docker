About
=========

It's docker created for fast run 3proxy anonymous instance with basic config.

Usage
=========

#### Simple:
```sh
docker run -d --name='3proxy' -P carcinogen75/3proxy
```
#### Advance:
Use custom 3proxy.cfg and port (place your custom 3proxy.cfg at  ~/3proxy_cfg_local_folder)
```sh
docker run -d --name='3proxy' -v ~/3proxy_cfg_local_folder:/etc/3proxy -p 40123:8080 carcinogen75/3proxy
```
