defmodule GithubInfo.GithubRepo do
  @enforce_keys [:id, :name, :description, :html_url, :stargazers_count]

  defstruct @enforce_keys

  @spec build(map()) :: %__MODULE__{}
  def build(%{
        "id" => id,
        "name" => name,
        "description" => description,
        "html_url" => html_url,
        "stargazers_count" => stargazers_count
      }) do
    %__MODULE__{
      id: id,
      name: name,
      description: description,
      html_url: html_url,
      stargazers_count: stargazers_count
    }
  end
end
