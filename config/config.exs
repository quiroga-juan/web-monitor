import Config

config :monitor, Monitor.Repo,
  database: "monitor",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: 5434

config :monitor, ecto_repos: [Monitor.Repo]
