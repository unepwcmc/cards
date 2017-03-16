defmodule Cards.GithubRecent.Client do
  @organisation "unepwcmc"

  def query do
    client  = Tentacat.Client.new(%{access_token: api_token()})
    repos   = Tentacat.Repositories.list_orgs(@organisation, client)

    pull_requests = repos
    |> Enum.map(&Task.async(fn -> get_pull_requests_for_repo(client, &1) end))
    |> Enum.map(&Task.await(&1, 10000))
    |> List.flatten
    |> Enum.filter(& &1["state"] == "open")
    |> Enum.map(&format/1)
    |> Enum.sort(& Timex.compare(&1.created_at, &2.created_at) == 1)
    |> Enum.take(3)

    {:ok, pull_requests}
  end

  def get_pull_requests_for_repo(client, %{"name" => repo}) do
    Tentacat.Pulls.list(@organisation, repo, client)
  end

  def format(pr) do
    name        = pr["title"]
    owner       = pr["user"]["login"]
    gravatar    = pr["user"]["avatar_url"]
    repo        = pr["base"]["repo"]["name"]
    created_at  = pr["created_at"] |> Timex.parse!("{ISO:Extended:Z}")
    created_at_formatted  = pr["created_at"] |> Timex.parse!("{ISO:Extended:Z}") |> Timex.format!("{h24}:{m} {WDshort}, {D} {Mshort} {YY}")

    %{name: name, owner: owner, repo: repo, created_at: created_at, created_at_formatted: created_at_formatted, gravatar: gravatar}
  end

  def api_token do
    [api_key: api_key] = Application.get_env(:cards, __MODULE__)
    api_key
  end
end
