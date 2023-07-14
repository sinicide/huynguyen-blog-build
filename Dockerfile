# Pull in golang base image
FROM golang:1.20.6

# ENV
ENV HUGO_VERSION 0.112.0
ENV HUGO_FILENAME hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz
ENV HUGO_BIN_URL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_FILENAME}
ENV HUGO_BUILD_ENVIRONMENT default
ENV HUGO_BUILD_SRC /workdir/src
ENV HUGO_BUILD_DEST /workdir/generated
ENV HUGO_PORT 1313

# download hugo
RUN cd /tmp && \
curl -O -L ${HUGO_BIN_URL} && \
tar -xvf ${HUGO_FILENAME} && \
mv /tmp/hugo /bin && \
rm -rf /tmp/* && \
mkdir -p ${HUGO_BUILD_DEST} 

# Clean up
RUN unset HUGO_FILENAME && \
unset HUGO_BIN_URL

# COPY Entrypoint
COPY ./entrypoint.sh /entrypoint.sh

# Change Directory
WORKDIR ${HUGO_BUILD_SRC}

# Hugo Server Port
EXPOSE ${HUGO_PORT}

# Entrypoint
ENTRYPOINT ["sh", "/entrypoint.sh"]
