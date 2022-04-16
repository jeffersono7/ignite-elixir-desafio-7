defmodule GithubInfo do
  @moduledoc """
  GithubInfo keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias GithubInfo.GithubRepos.Get, as: GithubRepoGet
  alias GithubInfo.Users.Create, as: UserCreate
  alias GithubInfo.Users.Get, as: GetUser

  defdelegate get_repos(username), to: GithubRepoGet, as: :call
  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate get_user(id), to: GetUser, as: :call
end
