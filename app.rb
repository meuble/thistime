require 'rubygems'
require 'sinatra'
require 'haml'
require "./src/picture"

set :haml, :format => :html5 # default Haml format is :xhtml

helpers do
  def partial(page, options={})
    haml page, options.merge!(:layout => false)
  end
end

get '/' do
  @pictures = Picture.all
  haml :index
end

get '/:id' do
  @picture = Picture.find(params[:id])
  haml :show
end