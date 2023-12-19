require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.enable_reloading = false

  # Eager load code on boot. This is especially important in production.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local = false

  # Enable static file serving from the `/public` folder.
  config.public_file_server.enabled = true  # Change this to `false` if using a web server like NGINX or Apache

  # Enable SSL for secure cookies and Strict-Transport-Security.
  config.force_ssl = true

  # Log to STDOUT by default. Adjust as needed for your log management strategy.
  config.logger = ActiveSupport::Logger.new(STDOUT)
    .tap { |logger| logger.formatter = ::Logger::Formatter.new }
    .then { |logger| ActiveSupport::TaggedLogging.new(logger) }

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

  # Set log level to "info" to avoid logging too much information.
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  # Enable locale fallbacks for I18n.
  config.i18n.fallbacks = true

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Add your application's hosts here
  config.hosts << "api.dagx.se"
  config.hosts << "dagx-backend-q8wi.onrender.com"

  # Mailer configuration. Adjust as per your production email service.
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    user_name: 'api',
    password: ENV['MAILTRAP_PASSWORD'],  
    address: 'live.smtp.mailtrap.io',
    port: '587',
    authentication: :login, 
    enable_starttls_auto: true  
  }
end