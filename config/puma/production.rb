run_dir = Rails.root.join('tmp')

# Store server info state.
state_path File.join(run_dir, 'puma.state')
state_permission 0o0640

# === Cluster mode ===

# How many worker processes to run.
#
workers 4

# In clustered mode, Puma can "preload" your application. This loads all the
# application code prior to forking. Preloading reduces total memory usage of
# your application via an operating system feature called copy-on-write
#
preload_app!

# When systemd socket activation is detected, only use those sockets. This
# makes FOREMAN_BIND redundant. The code is still there for non-systemd
# deployments.
bind_to_activated_sockets 'only'

# === Puma control rack application ===
activate_control_app "unix://#{run_dir}/sockets/pumactl.sock"
