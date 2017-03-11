use Mix.Config

config :cards,
  quotes_api: Cards.Quote.Client,
  hacker_news_api: Cards.HackerNews.Client,
  dribbble_api: Cards.Dribbble.Client,

config :cards, Cards.Dribbble.Client,
  api_key: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

import_config "#{Mix.env}.exs"
