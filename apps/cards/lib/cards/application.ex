defmodule Cards.Application do
  @moduledoc """
  The Cards Application Service.

  The cards system business domain lives in this application.

  Exposes API to clients such as the `Cards.Web` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    Supervisor.start_link([], strategy: :one_for_one, name: Cards.Supervisor)
  end
end
