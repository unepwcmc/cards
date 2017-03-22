defmodule Manager.Queue do
  @card_timeout 30000
  use GenServer
  require Logger

  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  # Client API
  ############
  def next do
    GenServer.call(__MODULE__, :next, @card_timeout)
  end

  def random do
    GenServer.call(__MODULE__, :random, @card_timeout)
  end

  # Server Callbacks
  ##################
  def init(:ok) do
    config = Application.get_env(:manager, __MODULE__)
    {:ok, state = config}
  end

  def handle_call(:next, _from, [card = {_, {module, config}} | rest]) do
    Logger.info "loading #{module}"
    {:reply, apply(module, :load, config), List.insert_at(rest, -1, card)}
  end

  def handle_call(:random, _from, state) do
    # get random card that is not on screen already
    from..to = 0..(length(state) - 1 - 6)

    index = Enum.random(from..to)
    {{_, {module, config}} = card, rest} = List.pop_at(state, index)

    Logger.info "loading #{module}"
    {:reply, apply(module, :load, config), List.insert_at(rest, -1, card)}
  end
end
