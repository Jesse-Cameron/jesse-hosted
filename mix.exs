defmodule JesseHosted.Mixfile do
  use Mix.Project

  def project do
    [
      app: :jesse_hosted,
      version: "1.3.2",
      elixir: "~> 1.8",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {JesseHosted.Application, []},
      extra_applications: [:logger, :runtime_tools, :cachex]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4.0"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:poison, "~> 5.0"},
      {:jason, "~> 1.0"},
      {:gettext, "~> 0.11"},
      {:plug, "~> 1.7"},
      {:plug_cowboy, "~> 2.0"},
      {:cachex, "~> 3.2.0"},
      {:mock, "~> 0.3.0", only: :test}
    ]
  end
end
