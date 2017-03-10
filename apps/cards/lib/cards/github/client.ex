defmodule Cards.Github.Client do
  @organisation "unepwcmc"

  def query do
    client  = Tentacat.Client.new(%{access_token: "928392873982932"})
    repos   = Tentacat.Repositories.list_orgs(@organisation, client)
    prs     = Enum.map(get_open_pull_requests_for_repo(client, repo)

    {:ok, stories}
  end

  def get_open_pull_requests_for_repo(client, repo) do
    Tentacat.Pulls.list @organisation, repo, client
  end

  def build_stories_from_ids(list) do
    list
    |> Enum.take(5)
    |> Enum.map(&Task.async(fn -> get_story(&1) end))
    |> Enum.map(&Task.await/1)
  end

  def get_story(id) do
    "https://hacker-news.firebaseio.com/v0/item/#{id}.json?print=pretty"
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Poison.decode!
  end

  def format(%{"total" => total, "score" => score, "by" => by}), do:
    %{total: title, score: score, by: by}

  def format(_), do:
    %{total: 0, by: "Error"}
end
