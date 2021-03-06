use Mix.Config

config :cards,
  quotes_api: Cards.Quote.Client,
  hacker_news_api: Cards.HackerNews.Client,
  github_api: Cards.Github.Client,
  github_recent_api: Cards.GithubRecent.Client,
  dribbble_api: Cards.Dribbble.Client,
  appsignal_api: Cards.Appsignal.Client

config :cards, Cards.Dribbble.Client,
  api_key: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

config :cards, Cards.Github.Client,
  api_key: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

config :cards, Cards.GithubRecent.Client,
  api_key: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

config :cards, Cards.Appsignal.Client,
  token: "xxxxxxxxxxxxxxxxxxxxxx"

config :tentacat, request_options: [recv_timeout: 10000]

import_config "#{Mix.env}.exs"

# As a safer alternative, create a #{Mix.env}.secret.exs file, and set your config
# in there (copy the config above and edit the values). That path is
# gitignored, so it'll never end up being pushed to origin
if __DIR__ |> Path.join("#{Mix.env}.secret.exs") |> File.exists? do
  import_config "#{Mix.env}.secret.exs"
end
