defmodule GithubInfoWeb.GithubReposView do
  use GithubInfoWeb, :view

  def render("repos.json", %{repos: repos}) do
    repos
  end
end
