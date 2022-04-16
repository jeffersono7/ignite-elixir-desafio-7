# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :github_info,
  ecto_repos: [GithubInfo.Repo]

config :github_info, GithubInfo.Repo, migration_primary_key: [type: :binary_id]

# Configures the endpoint
config :github_info, GithubInfoWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: GithubInfoWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: GithubInfo.PubSub,
  live_view: [signing_salt: "+xTGZlkF"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :github_info, GithubInfo.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Tesla
config :tesla, adapter: Tesla.Adapter.Hackney

config :github_info, GithubInfo.Clients.Github, adapter: GithubInfo.Clients.Github.Client

config :github_info, GithubInfoWeb.Auth.Guardian,
  issuer: "github_info",
  secret_key: "IYjXx5sx241E7Lcn251AXs7dNOQXbSs9ZPy5Y3/RgGBIOjdXuvCiXt86CcsGbf2b"

config :github_info, GithubInfoWeb.Auth.Pipeline,
  module: GithubInfoWeb.Auth.Guardian,
  error_handler: GithubInfoWeb.Auth.ErrorHandler

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
