# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenixUpdate13,
  ecto_repos: [PhoenixUpdate13.Repo]

# Configures the endpoint
config :phoenixUpdate13, PhoenixUpdate13Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DUENT6YbJV3BrgyWfLDZlyO8+IejGH9fWg7p4yWb9xrRCCmY4Xb0cOh4X6hQdF03",
  render_errors: [view: PhoenixUpdate13Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixUpdate13.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
