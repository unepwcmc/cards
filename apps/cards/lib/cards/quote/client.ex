defmodule Cards.Quote.Client do
  require Logger
  @api_url "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json"

  def query do
    HTTPoison.get!(@api_url)
    |> Map.get(:body)
    |> remove_silly_characters
    |> Poison.decode
    |> format
  end

  def format({:ok, %{"quoteText" => quote, "quoteAuthor" => author}}), do:
    {:ok, %{quote: quote, author: author}}
  def format(response) do
    Logger.info response
    {:error, :unexpected_response}
  end

  defp remove_silly_characters(body) do
    String.replace(body, "\\'", "'")
  end
end
