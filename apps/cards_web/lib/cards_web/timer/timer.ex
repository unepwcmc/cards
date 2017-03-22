defmodule Cards.Web.Timer do
  use GenServer
  import Integer, only: [mod: 2]

  def start_link(every, range) do
    GenServer.start_link(__MODULE__, [every: every, range: range], name: __MODULE__)
  end

  # Client API
  ############
  def reschedule(seconds_after) do
    # Process.send_after/3 asks for milliseconds
    Process.send_after(self(), :poll, seconds_after*1000)
  end

  # Server callbacks
  ##################
  def init(every: every, range: first..last) do
    reschedule(every)
    {:ok, %{id: first, every: every, range: first..last}}
  end

  def handle_info(:poll, %{id: id, every: every, range: first..last} = state) do
    Cards.Web.Endpoint.broadcast!(
      "cards:lobby",
      "new-card",
      %{id: id, card: Manager.next()}
    )

    reschedule(every)

    if id + 1 > last do
      {:noreply, %{state | id: first}}
    else
      {:noreply, %{state | id: id + 1}}
    end
  end
end
