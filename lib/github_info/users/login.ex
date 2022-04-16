defmodule GithubInfo.Users.Login do
  alias GithubInfo.{User, Users}
  alias Users.Get

  def verify(%{"id" => id, "password" => password}) do
    with {:ok, user} <- Get.call(id),
         :ok <- User.verify_password(user, password) do
      {:ok, user}
    else
      {:error, :invalid_password} ->
        Argon2.no_user_verify()

        {:error, :invalid_credentials}
      error -> error
    end
  end
end
