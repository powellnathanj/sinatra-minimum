require 'rubygems'
require 'compass'
require 'sinatra'
require 'haml'

# Then the router
require 'app'

Sinatra::Application.set(
   :run => false,
   :environment => ENV['RACK_ENV']
)

run Sinatra::Application
