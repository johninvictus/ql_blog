defmodule QlBlog.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      QlBlog.Repo,
      # Start the Telemetry supervisor
      QlBlogWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: QlBlog.PubSub},
      # Start the Endpoint (http/https)
      QlBlogWeb.Endpoint
      # Start a worker by calling: QlBlog.Worker.start_link(arg)
      # {QlBlog.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: QlBlog.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    QlBlogWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
