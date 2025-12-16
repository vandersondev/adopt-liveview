defmodule Apptest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ApptestWeb.Telemetry,
      Apptest.Repo,
      {DNSCluster, query: Application.get_env(:apptest, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Apptest.PubSub},
      # Start a worker by calling: Apptest.Worker.start_link(arg)
      # {Apptest.Worker, arg},
      # Start to serve requests, typically the last entry
      ApptestWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Apptest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ApptestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
