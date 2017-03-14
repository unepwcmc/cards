defmodule Cards.Web.CardsChannel do
  use Phoenix.Channel

  def join("cards:" <> _id, _message, socket) do
    {:ok, socket}
  end

  def handle_in("ask-new-card", %{"id" => id}, socket) do
    broadcast! socket, "new-card", %{id: id, card: random_card(id)}
    {:noreply, socket}
  end

  defp random_card id do
    [Cards.HackerNews,
     Cards.Quote,
     Cards.Unsplash,
     Cards.Dribbble,
     Cards.Github,
     Cards.Appsignal,
     Cards.Flavourtown] |> Enum.at(id-1) |> apply(:load, [])
  end
end
