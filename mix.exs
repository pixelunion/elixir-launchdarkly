defmodule ExLaunchDarkly.MixProject do
  use Mix.Project

  @version "0.0.9"

  def project do
    [
      app: :ex_launch_darkly,
      version: @version,
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [
        plt_add_apps: [:mix, :ex_unit],
        plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Dev and Test
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      # Everything else
      {:ldclient, github: "launchdarkly/erlang-server-sdk", tag: "1.0.0-beta4"}
    ]
  end
end
