defmodule Manager do
  @moduledoc """
  Documentation for Manager.
  """

  @doc """
  Returns the next card in Manager.Queue
  """
  def next do
    random_number = Enum.random(0..9)
    if random_number == 0 do
      Manager.Queue.random()
    else
      Manager.Queue.next()
    end
  end
end
