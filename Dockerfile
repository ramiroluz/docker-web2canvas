FROM python:2

MAINTAINER Claudio Ferreira <filhocf@gmail.com>

ARG PKG_PROXY

# Update all mirrors
RUN \
    # Set a package proxy in next line
    echo ${PKG_PROXY}; \
    echo ${PKG_PROXY} > /etc/apt/apt.conf; \
    apt-get update

# Install a tool set
RUN apt-get install -y nginx-full; \
    pip install uwsgi

RUN cd /usr/local/; \
    git clone --recursive https://github.com/web2py/web2py.git; \
    cd web2py; \
    mv handlers/wsgihandler.py .;\
    cd applications/; \
    git clone https://github.com/kolaborativa/web2canvas.git; \
    chown www-data.www-data /usr/local/web2py -R

COPY routes.py /usr/local/web2py
COPY run.sh /run.sh
COPY adjusts.sh /adjusts.sh

RUN /adjusts.sh

EXPOSE 80 443

CMD ["/run.sh"]
