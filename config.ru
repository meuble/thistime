require 'rubygems'
require 'vendor/sinatra/lib/sinatra.rb'

log = File.new("log/sinatra.log", "a+")
STDOUT.reopen(log)
STDERR.reopen(log)

require 'app.rb'
run Sinatra::Application
