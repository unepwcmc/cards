defmodule Cards.Dribbble do
  use Cards.Behaviour

  def load do
    client = Application.get_env(:cards, :dribbble_api)

    case client.query() do
      {:ok, response} -> render(response)
      {:error, _}     -> "<p>Could not load card</p>"
    end
  end
end
