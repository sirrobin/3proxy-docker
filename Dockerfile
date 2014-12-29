# Version: 0.0.1
FROM phusion/baseimage:0.9.15


# Install packages
RUN apt-get update
RUN apt-get install -y build-essential libevent-dev libssl-dev wget 

# Install 3rpoxy
WORKDIR /usr/src
RUN wget http://3proxy.ru/0.7.1.1/3proxy-0.7.1.1.tgz && tar zxvf 3proxy-0.7.1.1.tgz


WORKDIR /usr/src/3proxy
RUN make -f Makefile.Linux
RUN make -f Makefile.Linux install

# Add config file
ADD 3proxy.cfg /etc/3proxy/3proxy.cfg
RUN chmod 600 /etc/3proxy/3proxy.cfg

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create an `3proxy` `runit` service
ADD 3proxy /etc/sv/3proxy
RUN update-service --add /etc/sv/3proxy

EXPOSE 3128

ADD run.sh /usr/local/sbin/run
ENTRYPOINT ["/sbin/my_init", "--", "/usr/local/sbin/run"]

