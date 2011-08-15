require 'rubygems'
require 'sinatra'
require 'haml'


set :haml, :format => :html5 # default Haml format is :xhtml

get '/' do
  haml :index
end
