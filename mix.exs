defmodule App.Mixfile do
  use Mix.Project

  def project do
    [
      app: :app,
      version: "0.1.0",
      elixir: "~> 1.5",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:edeliver, :cowboy, :plug],
      extra_applications: [:logger],
      mod: {App, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, "~> 1.4"},
      {:cowboy, "~> 1.1"},
      {:edeliver, "~> 1.4.4"},
      {:distillery, "~> 1.4", runtime: false}
    ]
  end
end
