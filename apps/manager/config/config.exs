# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :manager, Manager.Queue, [
  hacker_news:   {Cards.HackerNews,   []},
  quote:         {Cards.Quote,        []},
  unsplash:      {Cards.Unsplash,     []},
  dribbble:      {Cards.Dribbble,     []},
  github:        {Cards.Github,       []},
  github_recent: {Cards.GithubRecent, []},
  appsignal:     {Cards.Appsignal,    ["57c84769ebad64166e99969a", "Protected Planet"]},
  appsignal:     {Cards.Appsignal,    ["56c5d74b776f725e76821201", "Species+"]},
  flavourtown:   {Cards.Flavourtown,  []}
]
