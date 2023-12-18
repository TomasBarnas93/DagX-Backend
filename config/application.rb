require_relative 'boot'

require "rails"
# Include each railtie manually, excluding those you don't need.
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
# Require other railties that you need (e.g., ActionMailer, ActiveStorage, etc.)

Bundler.require(*Rails.groups)

module DagXBackend
  class Application < Rails::Application
    config.load_defaults 7.1

    config.api_only = true

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'dagx.se', 'www.dagx.se'
        resource '*',
          headers: :any,
          methods: %i[get post put patch delete options head],
          credentials: false
      end
    end

    # Disable any middleware you do not need
    # config.middleware.delete ActionDispatch::Cookies
    # config.middleware.delete ActionDispatch::Session::CookieStore

    # Additional configuration...
  end
end
