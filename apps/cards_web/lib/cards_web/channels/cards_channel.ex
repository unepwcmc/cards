defmodule Cards.Web.CardsChannel do
  use Phoenix.Channel

  def join("cards:lobby", _message, socket) do
    {:ok, socket}
  end

  def handle_in("ask-new-card", %{"id" => id}, socket) do
    card = Cards.Quote.load()
    broadcast! socket, "new-card", %{id: id, card: card}

    {:noreply, socket}
  end
end
