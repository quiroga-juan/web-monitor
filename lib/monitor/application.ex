defmodule Monitor.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Monitor.Repo,
    ]

    pid_bot = spawn(fn -> TelegramBot.recibir_alertas() end)
    Process.register(pid_bot, :bot)
    pid_url_manager = spawn(fn -> UrlManager.recibir_alertas() end)
    Process.register(pid_url_manager, :url_manager)
        

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Monitor.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
