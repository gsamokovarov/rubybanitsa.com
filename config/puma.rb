# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart

# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum, this matches the default thread size of Active Record.
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests, default is 3000.
port        ENV.fetch("PORT") { 3000 }

# Specifies the `environment` that Puma will run in.
environment ENV.fetch("RAILS_ENV") { "development" }

# Save the pidfile, so we can introspect it and do a graceful restart. Save the
# state file, so we can introspect the running puma server with pumactl.
pidfile     'tmp/pids/puma.pid'
state_path  'tmp/pids/puma.state'

if ENV.fetch("RAILS_ENV") { "development" } == "development"
  # Allow puma to be restarted by `rails restart` command.
  plugin :tmp_restart
else
  # Specifies the number of `workers` to boot in clustered mode.
  # Workers are forked webserver processes. If using threads and workers together
  # the concurrency of the application would be max `threads` * `workers`.
  # Workers do not work on JRuby or Windows (both of which do not support
  # processes).
  workers ENV.fetch("WEB_CONCURRENCY") { 2 }

  # We wanna use the phased restart to zero-downtime deployment. See
  # https://github.com/puma/puma/blob/master/DEPLOYMENT.md#restarting for more
  # info.
  prune_bundler

  # The code in the `on_worker_boot` will be called if you are using
  # clustered mode by specifying a number of `workers`. After each worker
  # process is booted this block will be run, if you are using `preload_app!`
  # option you will want to use this block to reconnect to any threads
  # or connections that may have been created at application boot, Ruby
  # cannot share connections between processes.
  on_worker_boot do
    ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
  end
end
