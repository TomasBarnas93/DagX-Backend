# Puma configuration file

# Set the number of threads to a lower number to reduce memory usage
# Since you have limited memory, keeping it between 2 to 5 is reasonable
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { 2 }
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads min_threads_count, max_threads_count

# On a single CPU, multiple workers may not provide much benefit and can increase memory usage.
# You might want to limit it to 1 or 2 workers, or even consider running without extra workers in such a constrained environment.
if ENV["RAILS_ENV"] == "production"
  worker_count = Integer(ENV.fetch("WEB_CONCURRENCY") { 2 })
  workers worker_count if worker_count > 1
end

# Reduce the worker timeout in production to free up stuck workers faster
worker_timeout 30 if ENV.fetch("RAILS_ENV", "development") == "production"

# Default port configuration
port ENV.fetch("PORT") { 3000 }

# Set the environment
environment ENV.fetch("RAILS_ENV") { "development" }

# Specify the `pidfile`
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# Allow puma to be restarted by `bin/rails restart` command
plugin :tmp_restart
