defmodule Cards.Appsignal do
  use Cards.Behaviour

  def load do
    client = Application.get_env(:cards, :appsignal_api)
    values = client.query()
    labels = values |> length |> get_labels

    render(%{app: "Protected Planet", labels: labels, visits: values})
  end

  defp get_labels quantity do
    (-quantity..0) |> Enum.map(&past_day_label/1)
  end

  defp past_day_label hours_in_the_past do
    Timex.now()
    |> Timex.shift(hours: hours_in_the_past)
    |> Timex.format!("{WDfull} {h12}{AM}")
  end
end
