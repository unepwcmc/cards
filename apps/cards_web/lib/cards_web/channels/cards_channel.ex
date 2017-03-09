defmodule Cards.Web.CardsChannel do
  use Phoenix.Channel

  def join("cards:lobby", _message, socket) do
    {:ok, socket}
  end

  def handle_in("ask-new-card", %{"id" => id}, socket) do
    broadcast! socket, "new-card", %{id: id, card: random_card()}

    {:noreply, socket}
  end

  def random_card do
    [Cards.HackerNews, Cards.Quote, Cards.Unsplash, Cards.Flavourtown]
    |> Enum.random
    |> apply(:load, [])
  end
end
