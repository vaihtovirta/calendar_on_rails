FROM ruby:3.0-alpine

ARG BUNDLE_WITHOUT="development:test"
ARG BUNDLE_GITHUB__COM=""

ENV APP_HOME=/usr/src/app

RUN apk update \
    && apk upgrade \
    && apk update \
    && apk add --upgrade gcc git make libc-dev postgresql-dev tzdata shared-mime-info \
    g++ nodejs firefox-esr \
    && rm -rf /var/cache/apk/*

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"
RUN gem install bundler:2.2
RUN BUNDLE_GITHUB__COM=${BUNDLE_GITHUB__COM} BUNDLE_WITHOUT=${BUNDLE_WITHOUT} bundle install -j4
