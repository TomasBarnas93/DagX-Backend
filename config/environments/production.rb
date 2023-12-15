require "active_support/core_ext/integer/time"

Rails.application.configure do
  # ... [inne ustawienia] ...

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
