# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bandage,
  ecto_repos: [Bandage.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :bandage, BandageWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ax/+fDaGp3ZXDI3NInoRwwe6ixWKbO+rZUTq5ULKWnm6ZUHOXZKz1vlFFbFq4chl",
  render_errors: [view: BandageWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Bandage.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
