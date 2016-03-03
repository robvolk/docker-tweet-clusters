## Getting Started
1. Launch the Docker Quickstart Terminal app
2. Build & run the image:
  ```
  docker-compose build
  docker-compose up
  ```
3. Find Docker's IP:
  ```
  docker-machine ip default
  ```
4. Find some tweets about "Docker"!
  ```
  curl http://<docker_host>:4567/docker
  ```
5. Restart the Sinatra app after you make code changes
  ```
  docker-compose restart web
  ```

## Run the tests
```
docker-compose run --rm web bundle exec rspec spec
```

## Useful Info
### Bundle gems
To bundle gems & update Gemfile.lock:
```
docker-compose run web bundle install
```

### Re-build the containers
When you change the Dockerfile, you'll want to rebuild the containers like so:
```
docker-compose build
```

### Get your container's environment variables
docker-compose run web env
