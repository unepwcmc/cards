use Mix.Config

config :cards,
  quotes_api: Cards.Quote.Client

import_config "#{Mix.env}.exs"
