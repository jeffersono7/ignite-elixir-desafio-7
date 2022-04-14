defmodule GithubInfo.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table("users") do
      add :password_hash, :string, not_null: true

      timestamps()
    end
  end
end
