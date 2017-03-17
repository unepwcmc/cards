defmodule Cards.Web.CardsChannel do
  use Phoenix.Channel

  def join("cards:" <> id, _message, socket) do
    {:ok, socket}
  end

  def handle_in("ask-new-card", %{"id" => id}, socket) do
    broadcast! socket, "new-card", %{id: id, card: Manager.next()}
    {:noreply, socket}
  end
end
