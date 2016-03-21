FROM ruby:2.3.0-slim

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN mkdir /app
WORKDIR /app

# cache the gems on the container so you don't need to reinstall the gems every time
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

# we're already sharing the volume with docker-compose, however we'll want to
# copy the files to the container for when we ship it
ADD . /app
