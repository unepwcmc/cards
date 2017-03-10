use Mix.Config

config :cards,
  quotes_api: Cards.Quote.Client,
  hacker_news_api: Cards.HackerNews.Client,
  github_api: Cards.Github.Client

import_config "#{Mix.env}.exs"
