# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :manager, Manager.Queue, [
  hacker_news: %{mod: Cards.HackerNews, poll_every: 60*2},
  quote:       %{mod: Cards.Quote, poll_every: 60*2},
  unsplash:    %{mod: Cards.Unsplash, poll_every: 60*5},
  dribbble:    %{mod: Cards.Dribbble, poll_every: 60*2},
  github:      %{mod: Cards.Github, poll_every: 60*5},
  appsignal:   %{mod: Cards.Appsignal, poll_every: 60},
  appsignal:   %{mod: Cards.Appsignal, poll_every: 60},
  flavourtown: %{mod: Cards.Flavourtown, poll_every: 60}
]
