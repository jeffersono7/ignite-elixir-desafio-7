defmodule GithubInfo.Clients.Github.Behaviour do
  alias GithubInfo.{Error, GithubRepo}

  @callback user_repos(String.t, String.t) :: {:ok, list(GithubRepo.t)} | {:error, Error.t}
end
