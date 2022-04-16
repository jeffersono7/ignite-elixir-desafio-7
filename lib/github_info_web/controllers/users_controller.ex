defmodule GithubInfoWeb.UsersController do
  use GithubInfoWeb, :controller

  alias GithubInfo.User

  action_fallback GithubInfoWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- GithubInfo.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
