defmodule Cards.Appsignal do
  use Cards.Behaviour

  def load(app_id, app_name) do
    client = Application.get_env(:cards, :appsignal_api)

    case client.query(app_id) do
      {:error, _} ->
        "<p>Could not load the card</p>"
      values ->
        labels = values |> length |> get_labels
        render(%{app: app_name, labels: labels, visits: values})
    end
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
