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

  @doc """
  Returns the names of all cards in the Manager.Queue
  """
  def all_cards do
    Manager.Queue.all_cards()
  end

  @doc """
  Returns the card that matches the given identifier
  """
  def pick name do
    Manager.Queue.pick(name)
  end
end
