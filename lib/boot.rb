APP_ROOT = Pathname('../..').expand_path(__FILE__)
APP_ENV = ENV['RACK_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require(:default, APP_ENV)

Dir[APP_ROOT.join('lib/**/*.rb')].each { |path| require path }

require APP_ROOT.join('app')
App.use SprocketsMiddleware, %r{/assets} do |env|
  env.append_path 'assets/js'
  env.append_path 'assets/css'
  env.append_path 'assets/libs'
end

App.controllers.each { |path| require path }


options = {}
App.controllers.each do |path|
  name = File.basename(path, ".rb")
  options["/#{name}"] = name.camelize.constantize
end
options['/'] = App

Server = Rack::URLMap.new(options)
