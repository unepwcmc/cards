defmodule Cards.Flavourtown do
  use Cards.Behaviour

  @url "http://vignette2.wikia.nocookie.net/universe-of-smash-bros-lawl/images/a/a3/Guy_Fieri.png"

  def load do
    render(%{url: @url})
  end
end
