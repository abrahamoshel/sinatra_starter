require 'bundler/setup'
Bundler.require(:default, :test)

require File.expand_path('../../lib/boot', __FILE__)

def app
  Server
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Capybara::DSL
end

Capybara.configure do |config|
	config.app = Server
	config.asset_root = App.root
end


 Capybara.server do |app, port|
      require 'rack/handler/thin'
        Thin::Logging.silent = true
        Rack::Handler::Thin.run(Server, :Port => port)
  end
