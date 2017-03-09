defmodule Cards.Dribbble.TestClient do
  def query do
    {:ok, %{title: "Hey ho!", image: "https://example.com/image.jpg"}}
  end
end
