require_relative "boot"

require "rails/all"
Bundler.require(*Rails.groups)

module DagXBackend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Autoload paths optimization
    config.autoload_paths -= %W(#{config.root}/lib/templates)
    config.eager_load_paths -= %W(#{config.root}/lib/templates)

    # Since this is an API-only application, we skip loading unnecessary middleware.
    config.api_only = true

    # Explicitly require 'sprockets/railtie' to enable asset pipeline
    require 'sprockets/railtie'

    # Middleware configuration
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
    if Rails.env.production?
      config.log_level = :warn
    end

    # Enable asset pipeline
    config.assets.enabled = true

    # Specify the path to your assets
    config.assets.paths << Rails.root.join('app', 'assets')

    # Precompile additional assets
    config.assets.precompile += %w( *.js *.css )

    # Disable unnecessary generators
    config.generators do |g|
      g.helper = false
      g.assets = true
      g.view_specs = false
      g.helper_specs = false
      g.routing_specs = false
      g.controller_specs = false
    end
  end
end
