defmodule Cards.Github.Client do
  @organisation "unepwcmc"

  def query do
    client  = Tentacat.Client.new(%{access_token: api_token()})
    repos   = Tentacat.Repositories.list_orgs(@organisation, client)

    pull_requests = repos
    |> Enum.map(&Task.async(fn -> get_pull_requests_for_repo(client, &1) end))
    |> Enum.map(&Task.await/1)
    |> List.flatten
    |> Enum.filter(& &1["state"] == "open")
    |> Enum.map(&format/1)
    |> Enum.reduce(%{}, fn(repo_name, all_repos) ->
      Map.update(all_repos, repo_name, 1, &(&1 + 1))
    end)
    |> Enum.map(fn {k, v} -> %{repo_name: k, count: v} end)
    |> Enum.sort(& &1.count > &2.count)
    |> Enum.take(5)

    {:ok, pull_requests}
  end

  def get_pull_requests_for_repo(client, %{"name" => repo}) do
    Tentacat.Pulls.list(@organisation, repo, client)
  end

  def format(pull_request) do
    pull_request["base"]["repo"]["name"]
  end

  def api_token do
    [api_key: api_key] = Application.get_env(:cards, __MODULE__)
    api_key
  end
end
