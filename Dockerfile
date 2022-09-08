#!/bin/sh

# syntax=docker/dockerfile:1
FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /blog
COPY Gemfile /blog/Gemfile
COPY Gemfile.lock /blog/Gemfile.lock
RUN gem install bundler -v 2.3.7
RUN bundle install
COPY entrypoint.sh /bin/
RUN chmod +x /bin/entrypoint.sh

CMD ["entrypoint.sh"]