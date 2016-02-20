require 'sinatra'
require "redis-objects"

# Bind Sinatra to this IP instead of the default, localhost
set :bind, '0.0.0.0'

get '/' do
  # Since Docker uses a random IP for the container, we need to use environment variables.
  # To see which environment variables are set, run:
  # docker-compose run app env
  Redis.current = Redis.new(:host => ENV["REDIS_PORT_6379_TCP_ADDR"], :port => ENV["REDIS_PORT_6379_TCP_PORT"])

  @counter = Redis::Counter.new('counter_name')
  @counter.increment

  "aye, cap'n volk here!  you're mate numero #{@counter.value} to board the ship."
end
