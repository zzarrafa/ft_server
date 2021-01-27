FROM debian:buster

RUN apt update
RUN apt-get install -y nginx
RUN apt-get install -y php7.3-fpm php-mysql
RUN apt install -y  wget
ENV DEBIAN_FRONTEND noninteractive
RUN echo "mysql-apt-config mysql-apt-config/select-server select mysql-5.7" | debconf-set-selections
RUN apt -y install php-cli php-json php-pdo  php-zip php-gd  php-mbstring php-curl php-xml php-pear php-bcmath
RUN apt  -y install unzip
COPY srcs/* /tmp/

## SSL

RUN apt-get update &&  apt-get install -y openssl &&  openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/certs/key.key -x509 -days 365 -out /etc/ssl/certs/cer.crt -subj "/C=MA/ST=BENGUERIR/L=1337/O=ael-ghem/OU=IT Department/CN=Archi"

RUN bash /tmp/zz.sh
EXPOSE 80 443

CMD bash /tmp/start.sh && bash