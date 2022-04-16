defmodule GithubInfo.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:password]

  @derive {Jason.Encoder, only: [:id]}

  schema "users" do
    field :password_hash, :string, not_null: true
    field :password, :string, virtual: true, not_null: true

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> put_password_hash()
  end

  def verify_password(%__MODULE__{password_hash: password_hash}, password) do
    case Argon2.verify_pass(password, password_hash) do
      true -> :ok
      false -> :invalid_password
    end
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
