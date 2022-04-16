defmodule GithubInfoWeb.Auth.Guardian do
  use Guardian, otp_app: :github_info

  def subject_for_token(%{id: id}, _claims) do
    {:ok, to_string(id)}
  end

  def subject_for_token(_, _), do: {:error, :invalid_credentials}

  def resource_from_claims(%{"sub" => id}) do
    GithubInfo.get_user(id)
  end
end
