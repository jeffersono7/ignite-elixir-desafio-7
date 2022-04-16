defmodule GithubInfoWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :github_info

  plug Guardian.Plug.VerifyHeader, claims: %{typ: "access"}
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
