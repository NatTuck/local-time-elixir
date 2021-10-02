defmodule LocalTime.MixProject do
  use Mix.Project

  def project do
    [
      app: :local_time,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Some apps live in only one time zone",
      package: package(),
      source_url: "https://github.com/NatTuck/local-time-elixir",
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
      {:tzdata, "~> 1.1"},
    ]
  end

  defp package() do
    [
      name: "local_time",
      licenses: ["Apache-2.0"],
      links: %{"Github" => "https://github.com/NatTuck/local-time-elixir"},
    ]
  end
end
