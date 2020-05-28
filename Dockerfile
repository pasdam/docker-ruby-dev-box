FROM ruby:2.4.2-alpine3.7

ENV APP_HOME /opt/app
ENV RAILS_ENV development
ENV BUNDLER_VERSION=2.0.1

WORKDIR ${APP_HOME}

RUN apk update && \
    apk --no-cache add \
        build-base \
        git \
        linux-headers \
        mariadb-dev

RUN printf "alias ll='ls -lsa'\n" >> $HOME/.profile && \
    printf "alias t='RAILS_ENV=test bundle exec rspec'\n" >> $HOME/.profile

RUN gem install bundler -v $BUNDLER_VERSION
