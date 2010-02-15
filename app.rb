require 'rubygems'
require 'compass'
require 'sinatra'
require 'haml'
require 'rack-flash'

# This put ./lib in your path
$: << File.join(File.dirname(__FILE__), 'lib')
require 'app/util'

set :haml,          { :format => :html5 }
set :app_file,      __FILE__
set :root,          File.dirname(__FILE__)
set :logging,       :true
set :views,         'views'
set :public,        'static'
set :sessions,      true
use Rack::Flash,    :accessorize => [:notice, :error]

# Compass configuration
configure do
  Compass.configuration.parse(File.join(Sinatra::Application.root, 'config', 'compass.config'))
end

# Routes
get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :"stylesheets/#{params[:name]}", Compass.sass_engine_options
end

get '/' do
  haml :index
end

# Halpers
helpers do
  include App::Util

  def page_title
    "Application Title"
  end

end
