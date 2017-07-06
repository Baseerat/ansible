FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
		apache2 \
		python \
		python-memcache \
		python-psutil \
		git \
		wget

WORKDIR /root
RUN sed -i 's/Listen 80/Listen 8080/g' /etc/apache2/ports.conf \
&&  sed -i 's/VirtualHost \*:80/VirtualHost \*:8080/g' /etc/apache2/sites-enabled/000-default.conf \
&&  git clone https://gist.github.com/d1e41759ab722161c55f9b24ad3a3dca.git \
&&  mv d1e41759ab722161c55f9b24ad3a3dca/cpu.py /usr/lib/cgi-bin/ \
&&  rm -rf d1e41759ab722161c55f9b24ad3a3dca \
&&  chmod a+x /usr/lib/cgi-bin/cpu.py \
&&  sed -i 's/index.html index.cgi index.pl index.php index.xhtml index.htm/index.html index.cgi index.pl index.php index.xhtml index.htm cgi-bin\/cpu.py/g' /etc/apache2/mods-enabled/dir.conf \
&&  a2enmod cgid \
&&  service apache2 start \
&&  wget https://raw.githubusercontent.com/Baseerat/ipvs-dynamic-weight/master/request-lb-weight.py

CMD [ "/bin/bash", "-c", "rm -f /var/www/html/index.html; echo \"<!doctype html><html><body><h1>(Backend:$(hostname))</h1></body></html>\" | sudo tee -a /var/www/html/index.html; while true; do sleep 30; done;" ]
