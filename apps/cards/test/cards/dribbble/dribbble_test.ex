defmodule Cards.DribbbleTest do
  use ExUnit.Case, async: true

  test "load/0 returns an HTML string" do
    assert Cards.Dribbble.load() == """
    <div class="card-image">
      <img src="https://example.com/image.jpg">
      <span class="card-title">Hey ho!</span>
    </div>
    """
  end
end
