FROM ruby:2.3.0-slim

RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

# even though we're linking the directory as a volume in docker-compose.yml, we still need to add the files
ADD . /app
