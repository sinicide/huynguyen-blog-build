# Pull in golang base image
FROM golang:1.23.4

# ENV
ENV HUGO_VERSION 0.140.1
ENV HUGO_FILENAME hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz
ENV HUGO_BIN_URL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_FILENAME}
ENV HUGO_BUILD_ENVIRONMENT default
ENV HUGO_BUILD_SRC /workdir/src
ENV HUGO_BUILD_DEST /workdir/generated
ENV HUGO_PORT 1313
ENV DART_SASS_VERSION 1.83.0
ENV DART_SASS_FILENAME dart-sass-${DART_SASS_VERSION}-linux-x64.tar.gz
ENV DART_SASS_URL https://github.com/sass/dart-sass/releases/download/${DART_SASS_VERSION}/${DART_SASS_FILENAME}

# download Dart Sass
RUN cd /tmp && \
curl -O -L ${DART_SASS_URL} && \
tar -xf ${DART_SASS_FILENAME} && \
cp -r /tmp/dart-sass/* /usr/local/bin && \
rm -rf /tmp/dart-sass*

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
