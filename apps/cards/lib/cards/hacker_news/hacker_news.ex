defmodule Cards.HackerNews do
  use Cards.Behaviour
  @client Application.get_env(:cards, :hacker_news_api)

  def load do
    case @client.query() do
      {:ok, response} -> render(response)
      {:error, _}     -> "<p>Could not load card</p>"
    end
  end
end
