defmodule Cards.Dribbble.Client do
  require Logger

  def query do
    body = api_url() |> HTTPoison.get!  |> Map.get(:body)

    with {:ok, dribbbles} <- Poison.decode(body) do
      dribbble = dribbbles
      |> Stream.filter(& &1["animated"] == false )
      |> Enum.random
      |> format

      {:ok, dribbble}
    end
  end

  def format(%{"title" => title, "images" => %{"hidpi" => image}}), do:
    %{title: title, image: image}

  def api_url do
    api_key = Application.get_env(:cards, :dribbble_api_key)
    "https://api.dribbble.com/v1/shots?sort=views&access_token=#{api_key}"
  end
end
