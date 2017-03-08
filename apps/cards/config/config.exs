use Mix.Config

config :cards,
  quotes_api: Cards.Quote.Client,
  hacker_news_api: Cards.HackerNews.Client

import_config "#{Mix.env}.exs"
