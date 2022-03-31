defmodule GithubInfo.Clients.Github.Behaviour do
  alias GithubInfo.{Error, GithubRepo}

  @callback get_repo_info(String.t, String.t) :: {:ok, list(GithubRepo.t)} | {:error, Error.t}
end
