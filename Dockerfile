FROM python:2

MAINTAINER Claudio Ferreira <filhocf@gmail.com>

RUN cd /usr/local/; \
    git clone --recursive https://github.com/web2py/web2py.git; \
    cd web2py/applications/; \
    git clone https://github.com/kolaborativa/web2canvas.git; \
    chown www-data.www-data /usr/local/web2py -R

COPY routes.py /usr/local/web2py
COPY run.sh /run.sh
EXPOSE 8000

CMD ["/run.sh"]
