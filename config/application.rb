require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'websocket-client-simple'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rest
  class Application < Rails::Application

  end
end
