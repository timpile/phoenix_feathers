defmodule PhoenixFeathers.MixProject do
  use Mix.Project

  def project do
    [
      app: :phoenix_feathers,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "Phoenix Feathers",
      source_url: "https://github.com/timpile/phoenix_feathers",
      homepage_url: "https://github.com/timpile/phoenix_feathers",
      docs: docs(),
      elixirc_paths: elixirc_paths(Mix.env())
    ]
  end

  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp description() do
    "A component library built on top of Phoenix LiveView."
  end

  defp package() do
    [
      files: ~w(lib .formatter.exs mix.exs README* LICENSE* CHANGELOG* .env_example),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/timpile/phoenix_feathers"}
    ]
  end

  defp docs() do
    [
      main: "readme",
      extras: ["README.md"]
    ]
  end
end
