defmodule Cards.Appsignal.Client do
  use Timex

  def query do
    with {:ok, response} <- make_url() |> HTTPoison.get,
         {:ok, body}     <- response |> Map.get(:body) |> Poison.decode
    do
      body |> Map.get("data") |> Enum.map(& &1["count"])
    else
      _ -> {:error, :unexpected_response}
    end
  end

  defp make_url do
    {:ok, date} = Timex.today
      |> Timex.shift(weeks: -1)
      |> Timex.format("{ISO:Extended}")

    [app_id: app_id, token: token] = Application.get_env(:cards, __MODULE__)
    "https://appsignal.com/api/#{app_id}/graphs.json?token=#{token}&from=#{date}&kind=web&fields[]=count"
  end
end
