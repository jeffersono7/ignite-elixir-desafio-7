defmodule GithubInfoWeb.GithubReposController do
  use GithubInfoWeb, :controller

  def show(conn, %{"username" => username}) do
    with {:ok, repos} <- GithubInfo.get_repos(username) do
      conn
      |> put_status(:ok)
      |> render("repos.json", repos: repos)
    end
  end
end
