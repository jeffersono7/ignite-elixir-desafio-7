defmodule GithubInfo do
  @moduledoc """
  GithubInfo keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias GithubInfo.GithubRepos.Get, as: GithubRepoGet

  defdelegate get_repos(username), to: GithubRepoGet, as: :call
end
