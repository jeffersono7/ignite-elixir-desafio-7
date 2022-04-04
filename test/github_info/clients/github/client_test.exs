defmodule GithubInfo.Clients.Github.ClientTest do
  use ExUnit.Case, async: true

  alias GithubInfo.Clients.Github.Client
  alias GithubInfo.{Error, GithubRepo}
  alias Plug.Conn

  describe "user_repos/2" do
    setup do
      bypass = Bypass.open()

      {:ok, bypass: bypass}
    end

    test "when given username, returns the repos of the username", %{bypass: bypass} do
      username = "test123"

      Bypass.expect_once(bypass, "GET", "/users/#{username}/repos", fn conn ->
        conn
        |> Conn.resp(:ok, ~s([{
          "id": 1,
          "name": "test123-elixir",
          "description": "test with elixir",
          "html_url": "https://teste",
          "stargazers_count": 1092
        }]))
        |> Conn.put_resp_header("content-type", "application/json")
      end)

      repos = Client.user_repos(endpoint_url(bypass.port), username)

      assert {:ok, [%GithubRepo{id: 1}]} = repos
    end

    test "when user not found, return not found error", %{bypass: bypass} do
      username = "test123"

      Bypass.expect_once(bypass, "GET", "/users/#{username}/repos", fn conn ->
        conn
        |> Conn.resp(:not_found, "")
        |> Conn.put_resp_header("content-type", "application/json")
      end)

      assert {:error, %Error{status: :not_found}} =
               Client.user_repos(endpoint_url(bypass.port), username)
    end

    test "when server is down, return internal server error", %{bypass: bypass} do
      username = "test123"

      Bypass.down(bypass)

      assert {:error, %Error{status: :internal_server_error}} =
               Client.user_repos(endpoint_url(bypass.port), username)
    end
  end

  defp endpoint_url(port), do: "http://localhost:#{port}"
end
