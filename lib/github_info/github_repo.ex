defmodule GithubInfo.GithubRepo do
  @enforce_keys [:id, :name, :description, :html_url, :stargazers_count]

  defstruct @enforce_keys
end
