use Mix.Config

config :cards,
  quotes_api: Cards.Quote.Client,
  hacker_news_api: Cards.HackerNews.Client,
  dribbble_api: Cards.Dribbble.Client,

config :cards, Cards.Dribbble.Client,
  api_key: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

import_config "#{Mix.env}.exs"

# As a safer alternative, create a #{Mix.env}.secret.exs file, and set your config
# in there (copy the config above and edit the values). That path is
# gitignored, so it'll never end up being pushed to origin
if __DIR__ |> Path.join("#{Mix.env}.secret.exs") |> File.exists? do
  import_config "#{Mix.env}.secret.exs"
end
