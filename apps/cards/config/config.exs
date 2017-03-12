use Mix.Config

config :cards,
  quotes_api: Cards.Quote.Client,
  hacker_news_api: Cards.HackerNews.Client,
  dribbble_api: Cards.Dribbble.Client,
  appsignal_api: Cards.Appsignal.Client,
  dribbble_api_key: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

config :cards, Cards.Appsignal.Client,
  app_id: "xxxxxxxxxxxxxxxxxxxxxxxx",
  token: "xxxxxxxxxxxxxxxxxxxxxx"

import_config "#{Mix.env}.exs"
