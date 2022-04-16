defmodule GithubInfoWeb.FallbackController do
  use GithubInfoWeb, :controller

  alias GithubInfoWeb.ErrorView

  def call(conn, {:error, reason}) do
    conn
    |> put_view(ErrorView)
    |> put_status(:bad_request)
    |> render("400.json", reason: reason)
  end
end
