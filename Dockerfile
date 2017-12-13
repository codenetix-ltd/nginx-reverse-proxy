FROM nginx:stable
MAINTAINER Egor Zyuskin <ezyuskin@codenetix.com>

ADD ./etc/ /etc/
ADD ./usr/ /usr/

EXPOSE 80

ENTRYPOINT ["/usr/sbin/container-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
