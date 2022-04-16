defmodule GithubInfo.Users.Get do
  alias GithubInfo.{User, Repo}

  def call(id) do
    with {:ok, %User{} = user} <- Repo.get(User, id) do
      {:ok, user}
    end
  end
end
