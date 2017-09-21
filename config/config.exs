# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :imagemanagerprototype,
  ecto_repos: [Imagemanagerprototype.Repo]

# Configures the endpoint
config :imagemanagerprototype, ImagemanagerprototypeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bUNly8OOcWCa7T/ABZY7CTbVXemlZ9g8JTZsITYE9+do6jDTONKvjdtYdytrHTyc",
  render_errors: [view: ImagemanagerprototypeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Imagemanagerprototype.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
