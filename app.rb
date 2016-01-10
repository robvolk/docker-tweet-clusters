require "redis-objects"

puts "aye, cap'n volk here!"

# Since Docker uses a random IP for the container, we need to use environment variables.
# To see which environment variables are set, run:
# docker-compose run app env
Redis.current = Redis.new(:host => ENV["REDIS_PORT_6379_TCP_ADDR"], :port => ENV["REDIS_PORT_6379_TCP_PORT"])

@counter = Redis::Counter.new('counter_name')
@counter.increment
puts "Redis counter: #{@counter.value}"
