defmodule PhoenixFeathers.MixProject do
  use Mix.Project

  def project do
    [
      app: :phoenix_feathers,
      version: "1.0.0-alpha",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "Phoenix Feathers",
      source_url: "https://github.com/timpile/phoenix_feathers",
      homepage_url: "https://github.com/timpile/phoenix_feathers",
      docs: docs(),
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix] ++ Mix.compilers()
    ]
  end

  defp elixirc_paths(_), do: ["lib"]

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:jason, "~> 1.2"},
      {:phoenix_live_view, "~> 0.15.1"},
      {:floki, ">= 0.27.0", only: :test},
      {:ex_doc, "~> 0.22", only: :dev, runtime: false}
    ]
  end

  defp description() do
    "A component library built on top of Phoenix LiveView."
  end

  defp package() do
    [
      files: ~w(assets lib .formatter.exs mix.exs README* LICENSE* CHANGELOG*),
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
