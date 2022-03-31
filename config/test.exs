import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :github_info, GithubInfo.Repo,
  username: "gitubinfo",
  password: "githubinfo",
  hostname: "localhost",
  database: "githubinfo_db#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 20

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :github_info, GithubInfoWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "H83Wm1R++H94An2sYIEMHnkecr2xTjxlK6BGQns1zzBxk9gx0In5L/7glrSUN12P",
  server: false

# In test we don't send emails.
config :github_info, GithubInfo.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
