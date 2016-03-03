require "sinatra"
require "slim"

# Bind Sinatra to this IP instead of the default, localhost
set :bind, '0.0.0.0'

get '/' do
  slim :index
end
