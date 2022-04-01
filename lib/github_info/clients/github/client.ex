defmodule GithubInfo.Clients.Github.Client do
  use Tesla

  alias GithubInfo.Clients.Github.Behaviour
  alias GithubInfo.{Error, GithubRepo}
  alias Tesla.Env

  @behaviour Behaviour

  plug Tesla.Middleware.JSON

  @url_github "https://api.github.com"

  @impl true
  def user_repos(url \\ @url_github, username) do
    "#{url}/users/#{username}/repos"
    |> get()
    |> handle_response()
  end

  defp handle_response({:ok, %Env{status: 200, body: body}}) do
    repos = body |> Enum.map(&GithubRepo.build/1)

    {:ok, repos}
  end

  defp handle_response({:ok, %Env{status: 404}}) do
    {:error, %Error{status: :not_found, reason: "User not found"}}
  end

  defp handle_response({:error, _reason}) do
    {:error, %Error{status: :internal_server_error, reason: "Internal server error"}}
  end
end
