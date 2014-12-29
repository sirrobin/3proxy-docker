Quick 3proxy container based on phusion baseimage

Usage
=========

edit 3proxy.cg to use your own user/pass

build it
docker build -t 3proxy .


run it. change listen port as needed

docker run --restart=always --name 3proxy -p 80:3128 -d 3proxy
