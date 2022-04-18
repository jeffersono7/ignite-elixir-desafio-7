defmodule GithubInfoWeb.GithubReposController do
  use GithubInfoWeb, :controller

  alias GithubInfoWeb.Auth.Guardian

  def show(conn, %{"username" => username}) do
    token = Guardian.Plug.current_token(conn)

    token_refresh_async = Task.async(fn -> Guardian.refresh(token, ttl: {1, :minute}) end)

    with {:ok, repos} <- GithubInfo.get_repos(username) do
      {:ok, _old_stuff, {new_token, _new_claims}} = Task.await(token_refresh_async)

      conn
      |> put_status(:ok)
      |> render("repos.json", repos: repos, token: new_token)
    end
  end
end
