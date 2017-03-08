defmodule Cards.QuoteTest do
  use ExUnit.Case, async: true

  test "load/0 returns an HTML string" do
    assert Cards.Quote.load() == """
    <h1>Take your hands off my lobby boy!</h1>
    <em>Monsieur Gustave</em>
    """
  end
end
