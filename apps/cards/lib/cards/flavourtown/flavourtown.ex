defmodule Cards.Flavourtown do
  use Cards.Behaviour

  @url "http://vignette2.wikia.nocookie.net/universe-of-smash-bros-lawl/images/a/a3/Guy_Fieri.png"

  def load do
    render(%{url: @url, quote: random_quote})
  end

  def random_quote do
    [
      "Cooking is like snow skiing: If you don't fall at least 10 times, then you're not skiing hard enough.",
      "When cooking for a big crew of hungry dudes who’ve been sleeping in a parking lot, do not think you can get away with fettucini Alfredo.",
      "No matter how tough the meat may be, it's going to be tender if you slice it thin enough",
      "Peace, love and taco grease!",
      "I wanna be the ambassador to Chimichanga Flavour Town.",
      "I just want to live my life. Please, leave me in peace. I am a man. I have dignity. I am a man."
    ] |> Enum.random
  end
end
