Quick 3proxy container based on phusion baseimage

Usage
=========

edit 3proxy.cg to use your own user/pass

build it
docker build -t 3proxy .


run it. change listen port as needed

docker run --restart=always --name 3proxy -p 80:3128 -d 3proxy

to restart 3proxy if you edit the cfg file, run this from within the container

/usr/bin/killall -s USR1 3proxy
