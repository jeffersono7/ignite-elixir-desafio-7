defmodule GithubInfoWeb.LoginController do
  use GithubInfoWeb, :controller

  alias GithubInfo.Users.Login

  action_fallback GithubInfoWeb.FallbackController

  def create(conn, params) do
    with {:ok, user} <- Login.verify(params),
         {:ok, token, _claims} <- GithubInfoWeb.Auth.Guardian.encode_and_sign(user, %{}, ttl: {5, :minute}) do
      conn
      |> put_status(:created)
      |> json(%{token: token})
    end
  end
end
