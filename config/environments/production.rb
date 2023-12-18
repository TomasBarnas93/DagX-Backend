# config/environments/production.rb

require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.enable_reloading = false
  config.eager_load = true
  config.consider_all_requests_local = false
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.force_ssl = true
  
  # Set log level and customize the log formatting
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")
  config.log_tags = [:request_id]
  config.logger = ActiveSupport::Logger.new(STDOUT)
  config.logger.formatter = ::Logger::Formatter.new
  config.log_formatter = proc do |severity, time, progname, msg|
    formatted_time = time.strftime("%Y-%m-%d %H:%M:%S")
    "[#{formatted_time}] #{severity} #{msg}\n"
  end

  config.i18n.fallbacks = true
  config.active_record.dump_schema_after_migration = false
  config.assets.compile = true

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
