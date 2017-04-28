defmodule Cards.Web.SlackController do
  use Cards.Web, :controller
  alias Cards.Web.Timer

  def slash(conn, %{"text" => "list"}) do
    cards = Manager.all_cards |> Enum.map(& "- #{&1}") |> Enum.join("\n")
    json conn, %{text: ~s(The available cards are: \n#{cards})}
  end

  def slash(conn, %{"text" => "shuffle"}) do
    for _ <- 1..6 do Timer.trigger() end
    json conn, %{text: "Shuffling cards…"}
  end

  def slash(conn, %{"text" => <<"pick ", name :: binary>>}) do
    name |> String.to_existing_atom |> Timer.pick
    json conn, %{text: "Showing card #{name}…"}
  end


  def slash(conn, _params) do
    json conn, show_help()
  end

  defp show_help do
    "Help!"
  end
end

