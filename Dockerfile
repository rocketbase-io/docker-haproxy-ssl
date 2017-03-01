FROM progrium/busybox
MAINTAINER pjpires@gmail.com
MAINTAINER niels.schelbach@rocketbase.io

EXPOSE 80 443

# Add stuff
RUN opkg-install haproxy ca-certificates

VOLUME ["/etc/haproxy/certs"]

ENV WEBSERVER   webserver
ENV WEBSERVER_PORT  8080

ADD haproxy.cfg /etc/haproxy/haproxy.cfg

CMD ["/usr/sbin/haproxy", "-db", "-f", "/etc/haproxy/haproxy.cfg"]