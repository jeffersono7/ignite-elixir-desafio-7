defmodule GithubInfo.Error do
  @enforce_keys [:status, :reason]

  defstruct @enforce_keys
end
