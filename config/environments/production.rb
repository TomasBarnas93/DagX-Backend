require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Code is not reloaded between requests to save memory.
  config.enable_reloading = false

  # Eager load code on boot to reduce response times.
  config.eager_load = true

  # Show full error reports only in development; in production, it should be false.
  config.consider_all_requests_local = false

  # Serve static files from the `/public` folder. Set to `true` if you're not using an external service like a CDN.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Use local storage for Active Storage. Consider cloud storage for better performance.
  config.active_storage.service = :local

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # Set to `true` if you have an SSL certificate.
  config.force_ssl = ENV['RAILS_FORCE_SSL'].present?

  # Reduce logging to minimize disk I/O and save space.
  config.log_level = :warn

  # Enable caching of Action Mailer views for better performance.
  config.action_mailer.perform_caching = true

  # Set fallback locale to something other than :false if you want missing translations to fall back.
  config.i18n.fallbacks = [I18n.default_locale]

  # Don't log deprecations to reduce log volume.
  config.active_support.report_deprecations = false

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Use Uglifier for JavaScript compression.
  config.assets.js_compressor = :uglifier
  # Do not compile assets in production; use `rails assets:precompile`.
  config.assets.compile = false

  # Configure Action Mailer for SMTP.
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    user_name: 'api',
    password: ENV['MAILTRAP_PASSWORD'],
    address: 'live.smtp.mailtrap.io',
    port: '587',
    authentication: :login, 
    enable_starttls_auto: true  
  }
  
  # Add your production domain here
  config.hosts << "api.dagx.se"

  # Additional production-specific configurations can be added here
end
