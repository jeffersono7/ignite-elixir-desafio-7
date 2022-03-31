defmodule GithubInfo.Clients.Github.Client do
  alias GithubInfo.Clients.Github.Behaviour
  alias GithubInfo.{Error, GithubRepo}

  @behaviour Behaviour

  @impl true
  def get_repo_info(_url, _username) do
    {:error, %Error{status: :bad_request, reason: "not implemented yet!"}}
  end
end
