FROM alpine:3.5

LABEL maintainer Steve Crabb <steve@crabb.io>

ENV GITHUB_PAGES_VERSION 136

RUN apk add --update --no-cache \
    build-base \
    libcurl \
    libffi \
    libffi-dev \
    libxml2 \
    libxml2-dev \
    nodejs \
    readline \
    readline-dev \
    ruby \
    ruby-dev \
    ruby-io-console \
    ruby-json \
    ruby-rake \
    yaml \
    yaml-dev \
    zlib \
    zlib-dev

RUN gem install --no-document \
    bundler \
    github-pages:${GITHUB_PAGES_VERSION}

VOLUME /srv/jekyll

WORKDIR /srv/jekyll

EXPOSE 4000

CMD jekyll --version && \
    github-pages versions
