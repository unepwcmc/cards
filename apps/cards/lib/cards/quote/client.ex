defmodule Cards.Quote.Client do
  @api_url "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json"

  def query do
    HTTPoison.get!(@api_url)
    |> Map.get(:body)
    |> Poison.decode!
    |> format
  end

  def format(%{"quoteText" => quote, "quoteAuthor" => author}), do:
    {:ok, %{quote: quote, author: author}}
  def format(_), do:
    {:error, :unexpected_response}
end
