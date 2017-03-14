use Mix.Config

config :cards,
  quotes_api: Cards.Quote.TestClient,
  hacker_news_api: Cards.HackerNews.TestClient,
  github_api: Cards.Github.TestClient,
  dribbble_api: Cards.Dribbble.TestClient
