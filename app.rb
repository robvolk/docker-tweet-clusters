require "sinatra"
require "twitter"

# Bind Sinatra to this IP instead of the default, localhost
set :bind, '0.0.0.0'

get '/:query' do |query|
  client = Twitter::REST::Client.new do |config|
    config.consumer_key    = "OaAwMgTM6kWW5JK6FIYRgPc6I"
    config.consumer_secret = "RrEFhVohXkRZWKX21c4RVBbK6Se23l4VekSUXpsEMgXOT5fqsV"
  end

  tweets = client.search(query, result_type: "recent", count: 3)

  text = tweets.map do |tweet|
    "x #{tweet.text}\n"
  end

  "Found #{tweets.count} tweets\n#{text}"
end
