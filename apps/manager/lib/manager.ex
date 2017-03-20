defmodule Manager do
  @moduledoc """
  Documentation for Manager.
  """

  @doc """
  Returns the next card in Manager.Queue
  """
  def next do
    Manager.Queue.next()
  end
end
