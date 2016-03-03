require "sinatra"
require "slim"

# Bind Sinatra to this IP instead of the default, localhost
set :bind, '0.0.0.0'

get '/' do
  @io_url = ENV["STREAMER_URL"]
  slim :index
end
