defmodule GithubInfoWeb.UsersView do
  use GithubInfoWeb, :view

  def render("create.json", %{user: user}) do
    %{user: user}
  end
end
