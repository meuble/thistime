require 'rubygems'
require 'vendor/sinatra/lib/sinatra.rb'

Sinatra::Application.default_options.merge!(
	:views => File.join(File.dirname(__FILE__), 'views'),
	:run => false,
	:environment => ENV['RACK_ENV'],
	:raise_errors => true
)

log = File.new("log/sinatra.log", "a+")
STDOUT.reopen(log)
STDERR.reopen(log)

require 'app.rb'
run Sinatra.application
