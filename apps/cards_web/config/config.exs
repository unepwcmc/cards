# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cards_web,
  namespace: Cards.Web

# Configures the endpoint
config :cards_web, Cards.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5jzRS0vrbRd9jOWmp+mxo4PhL0Pc+/yL51j43PDLb2VI14bE32XLZ7RBgDd7je+3",
  render_errors: [view: Cards.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cards.Web.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
