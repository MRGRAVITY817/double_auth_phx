defmodule DoubleAuth.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      DoubleAuthWeb.Telemetry,
      # Start the Ecto repository
      DoubleAuth.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: DoubleAuth.PubSub},
      # Start Finch
      {Finch, name: DoubleAuth.Finch},
      # Start the Endpoint (http/https)
      DoubleAuthWeb.Endpoint
      # Start a worker by calling: DoubleAuth.Worker.start_link(arg)
      # {DoubleAuth.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DoubleAuth.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DoubleAuthWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
