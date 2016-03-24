# Docker Example App: Ruby, RSpec, Node.js, & MongoDB
Showcases how you can use Docker containers to host an application with
several different services each written in different languages.
Docker Compose orchetrates and connects the services on your local dev machine
so you can start the whole thing with just one command.  It's like magic!

#### Containers
* **web**: Ruby + Sinatra web app
* **streamer**: Node.js + Socket.io web sockets service
* **mongodb**: data store for web app

#### Application Flow

1. Streams Tweets from all the Beliebers from a Node.js + Socket.io service to a Ruby + Sinatra web service
* Web service persists the tweets in MongoDB
* Ruby app tested with RSpec

![Tweet Streamer Container Diagram](https://cloud.githubusercontent.com/assets/1644236/14019246/cc960358-f19f-11e5-8f64-38b63971e5a7.png)

## Installation
1. Install [Docker Toolbox](https://www.docker.com/products/docker-toolbox)
* Launch the Docker Quickstart App
* Build the containers:
  ```
  docker-compose build
  ```
* Find Docker's IP:
  ```
  docker-machine ip default
  ```
* Add a host entry to `/etc/hosts`:
  ```
  192.168.99.100 docker.local
  ```
* Launch your containers!
  ```
  docker-compose up
  ```
* Watch Tweets about the Biebs streaming live: http://docker.local:4567

## Run the tests
```
docker-compose run --rm web bundle exec rspec spec
```

## Useful Info
### Bundle gems
To bundle gems & update Gemfile.lock:
```
docker-compose run web bundle install # update host Gemfile.lock
docker-compose build                  # update cached Gemfile.lock on container
```

### Add a Node.js package
```
docker-compose run streamer npm install {package} --save
```


### Re-build the containers
When you change the Dockerfile, you'll want to rebuild the containers like so:
```
docker-compose build
```

### Get your container's environment variables
```
docker-compose run web env
```
