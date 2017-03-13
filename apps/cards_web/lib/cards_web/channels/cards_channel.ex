defmodule Cards.Web.CardsChannel do
  use Phoenix.Channel

  def join("cards:" <> _id, _message, socket) do
    {:ok, socket}
  end

  def handle_in("ask-new-card", %{"id" => id}, socket) do
    broadcast! socket, "new-card", %{id: id, card: random_card()}
    {:noreply, socket}
  end

  defp random_card do
    [Cards.HackerNews,
     Cards.Quote,
     Cards.Unsplash,
     Cards.Flavourtown,
     Cards.Dribbble,
     Cards.Appsignal,
     Cards.Github] |> Enum.random |> apply(:load, [])
  end
end
