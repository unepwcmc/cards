defmodule Manager.Queue do
  @card_timeout 10000
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  # Client API
  ############
  def next do
    GenServer.call(__MODULE__, :next, @card_timeout)
  end

  # Server Callbacks
  ##################
  def init(:ok) do
    config = Application.get_env(:manager, __MODULE__)
    {:ok, state = config}
  end

  def handle_call(:next, _from, [card = {_, {module, config}} | rest]) do
    {:reply, apply(module, :load, config), List.insert_at(rest, -1, card)}
  end
end
