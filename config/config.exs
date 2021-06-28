import Config

config :monitor, Monitor.Repo,
  database: "monitor",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: 5432

config :monitor, ecto_repos: [Monitor.Repo]
