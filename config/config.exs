# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ql_blog,
  ecto_repos: [QlBlog.Repo]

# Configures the endpoint
config :ql_blog, QlBlogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "J9tGWQsCRmQ06YM7uOBeSCLmfS71DLMSSabBxj44NbHbfEYyE5JWmMIq6WC8CBOQ",
  render_errors: [view: QlBlogWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: QlBlog.PubSub,
  live_view: [signing_salt: "ZOAcvJcp"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
