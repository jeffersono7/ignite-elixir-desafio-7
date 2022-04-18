defmodule GithubInfoWeb.GithubReposView do
  use GithubInfoWeb, :view

  def render("repos.json", %{repos: repos, token: token}) do
    %{repos: repos, token: token}
  end
end
