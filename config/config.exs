# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :jesse_hosted, JesseHostedWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mMVIlI0dicmOrNT2QOCJBxrLNjeqiK8LSNGJdvO9bTmvmpLuqS+M5fWx2HtwN7Uf",
  render_errors: [view: JesseHostedWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: JesseHosted.PubSub, adapter: Phoenix.PubSub.PG2]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
