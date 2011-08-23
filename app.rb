# coding: utf-8

require 'rubygems'
require 'sinatra'
require 'haml'
require 'awesome_print'
require 'yaml'
require 'bluecloth'
require "./src/picture"

set :haml, :format => :html5 # default Haml format is :xhtml

helpers do
  def partial(page, options={})
    haml page, options.merge!(:layout => false)
  end
end

get '/' do
  @title = "This Time - Stéphane Akkaoui's photo blog"
  @pictures = Picture.all
  haml :index
end

get '/rss' do
  @title = "This Time - Stéphane Akkaoui's photo blog"
  @pictures = Picture.all
  
  haml(:rss, :format => :xhtml, :escape_html => false, :layout => false)
end

get '/:id' do
  @picture = Picture.find(params[:id])
  @title = @picture.nil? ? "This Time - Stéphane Akkaoui's photo blog" : @picture.title
  haml :show
end