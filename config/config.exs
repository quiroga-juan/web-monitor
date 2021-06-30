# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config
config :monitor, Monitor.Repo,
  database: "monitor",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: 5432

config :monitor,
  ecto_repos: [Monitor.Repo]

# Configures the endpoint
config :monitor, MonitorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "o/yaGbaV36lNcTjkbZoKc55WYH7bsJR5sFfpgWO0jxDcF4GhgWNRbTQW46psv/KX",
  render_errors: [view: MonitorWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Monitor.PubSub,
  live_view: [signing_salt: "/pJ+iOmz"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
