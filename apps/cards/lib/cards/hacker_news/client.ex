defmodule Cards.HackerNews.Client do
  @top_stories_url "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"

  def query do
    stories = HTTPoison.get!(@top_stories_url)
    |> Map.get(:body)
    |> Poison.decode!
    |> build_stories_from_ids
    |> Enum.map(&format/1)

    {:ok, stories}
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

  def format(%{"title" => title, "score" => score, "by" => by}), do:
    %{title: title, score: score, by: by}

  def format(_), do:
    %{title: "Could not fetch story", score: 0, by: "Error"}
end
