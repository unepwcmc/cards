defmodule Cards.Behaviour do
  @callback load() :: String.t

  defmacro __using__(_opts \\ []) do
    quote do
      @behaviour Cards.Behaviour

      require EEx
      EEx.function_from_file(:def, :render, Path.join(__DIR__, "template.html.eex"), [:data])
    end
  end
end
