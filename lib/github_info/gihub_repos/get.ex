defmodule GithubInfo.GithubRepos.Get do
  def call(username) do
    client().user_repos(username)
  end

  defp client do
    Application.fetch_env!(:github_info, GithubInfo.Clients.Github)[:adapter]
  end
end
