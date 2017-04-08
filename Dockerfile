FROM r-base:3.3.3

MAINTAINER "Dimitris Vichos" dimitris.vic@gmail.com

# add build scripts
ADD build /build
RUN apt-get update

# en_GB
RUN echo "en_GB.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen en_GB.utf8 \
    && /usr/sbin/update-locale LANG=en_GB.UTF-8
ENV LC_ALL en_GB.UTF-8
ENV LANG en_GB.UTF-8

# R libraries
RUN cd /build/R && ./install.sh

# texlive
RUN cd /build/tex && ./install.sh

# cleanup
RUN apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /build

CMD ["R"]
