defmodule GithubInfo.Repo do
  use Ecto.Repo,
    otp_app: :github_info,
    adapter: Ecto.Adapters.Postgres
end
