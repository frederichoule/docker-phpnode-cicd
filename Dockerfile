FROM ubuntu:20.04
LABEL maintainer="frederic@frederichoule.com"
LABEL version="0.1"
LABEL description="Ubuntu 20.04 image with PHP (composer), Node (nvm, npm) and rsync."
ENV DEBIAN_FRONTEND noninteractive
ARG PHP_VERSION=7.4
COPY setup/setup.sh /tmp
COPY setup/composer.sh /tmp
RUN chmod +x /tmp/setup.sh
RUN chmod +x /tmp/composer.sh
RUN ./tmp/setup.sh
RUN ./tmp/composer.sh
RUN mkdir /helpers
COPY helpers/load_ssh_key.sh /helpers/load_ssh_key
COPY helpers/nvm_install.sh /helpers/nvm_install
COPY helpers/scan_host_key.sh /helpers/scan_host_key
RUN chmod -R +x /helpers