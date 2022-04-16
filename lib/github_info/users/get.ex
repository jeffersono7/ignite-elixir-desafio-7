defmodule GithubInfo.Users.Get do
  alias GithubInfo.{User, Repo}

  def call(id) do
    with %User{} = user <- Repo.get(User, id) do
      {:ok, user}
    else
      nil -> {:error, :not_found}
    end
  end
end
