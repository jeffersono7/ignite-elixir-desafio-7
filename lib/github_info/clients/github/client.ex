defmodule GithubInfo.Clients.Github.Client do
  use Tesla

  alias GithubInfo.Clients.Github.Behaviour
  alias GithubInfo.{Error, GithubRepo}
  alias Tesla.Env

  @behaviour Behaviour

  plug Tesla.Middleware.JSON

  @impl true
  def user_repos(url, username) do
    "#{url}/users/#{username}/repos"
    |> get()
    |> handle_response()
  end

  defp handle_response({:ok, %Env{status: 200, body: body}}) do
    repos = body |> Enum.map(&GithubRepo.build/1)

    {:ok, repos}
  end
end
