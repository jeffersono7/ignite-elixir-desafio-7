defmodule GithubInfo.Users.Create do
  alias GithubInfo.{User, Repo}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
