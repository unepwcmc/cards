defmodule Cards.Quote.TestClient do
  def query do
    {:ok, %{
      quote: "Take your hands off my lobby boy!",
      author: "Monsieur Gustave"
    }}
  end
end
