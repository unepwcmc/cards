defmodule Cards.Web.CardsChannel do
  use Phoenix.Channel

  def join("cards:" <> _id, _message, socket) do
    {:ok, socket}
  end
end
