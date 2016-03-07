FROM ubuntu:14.04
RUN apt-get -y update
RUN apt-get install -y python-setuptools unzip
RUN apt-get install -y libsasl2-dev python-dev libldap2-dev libssl-dev  libpq-dev libmysqlclient-dev \
    libfontconfig1 libxrender1 \
    libfreetype6 libc6 zlib1g libpng12-0\
    libxtst6

RUN apt-get install -y build-essential
RUN easy_install pip
ADD instantclient-basic-linux.x64-12.1.0.2.0.zip /opt
ADD instantclient-sdk-linux.x64-12.1.0.2.0.zip /opt
RUN cd /opt && unzip  /opt/instantclient-basic-linux.x64-12.1.0.2.0.zip
RUN cd /opt && unzip  /opt/instantclient-sdk-linux.x64-12.1.0.2.0.zip
RUN cd /opt/instantclient_12_1 && ln -s libclntsh.so.12.1 libclntsh.so
RUN cd /opt/instantclient_12_1 && ln -s llibclntshcore.so.12.1 libclntshcore.so
RUN cd /opt/instantclient_12_1 && ln -s libocci.so.12.1 libocci.so
ENV ORACLE_HOME=/opt/instantclient_12_1
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${ORACLE_HOME}
RUN mkdir /code
RUN mkdir /code/src
RUN mkdir /static
RUN mkdir /static_tel
WORKDIR /code

ADD ./require.txt /code/require.txt
RUN pip install -U pip
RUN pip install -r require.txt
RUN apt-get install libaio1 libaio-dev
ENV PYTHONIOENCODING=UTF-8
RUN apt-get install -y postgresql-client

WORKDIR /code/src/


