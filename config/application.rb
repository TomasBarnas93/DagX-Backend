require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DagXBackend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Autoload paths optimization
    # Exclude directories that don't need to be autoloaded/eager loaded.
    config.autoload_paths -= %W(#{config.root}/lib/templates)
    config.eager_load_paths -= %W(#{config.root}/lib/templates)

    # API-only optimizations
    # Since this is an API-only application, we skip loading unnecessary middleware.
    config.api_only = true

    # Middleware configuration
    # Configure CORS for handling Cross-Origin Resource Sharing.
    # Adjust the origins according to your frontend's domain.
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'dagx.se', 'www.dagx.se'
        resource '*',
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head],
          credentials: true
      end
    end

    # Logger configuration
    # Configure the logger to a lower level in production to reduce disk I/O.
    if Rails.env.production?
      config.log_level = :warn
    end

    # Disable unnecessary generators
    # This prevents generating unnecessary files like view specs, helper specs, etc.
    config.generators do |g|
      g.helper = false
      g.assets = false
      g.view_specs = false
      g.helper_specs = false
      g.routing_specs = false
      g.controller_specs = false
    end
  end
end
