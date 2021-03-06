defmodule Genex.MixProject do
  use Mix.Project

  @version "0.2.1"
  @url "https://www.github.com/seanmor5/genex"
  @maintainers ["Sean Moriarity"]

  def project do
    [
      name: "Genex",
      app: :genex,
      version: @version,
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package(),
      source_url: @url,
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      maintainers: @maintainers,
      homepage_url: @url,
      description: description(),
      docs: docs(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  def application do
    [
      extra_applications: [:table_rex]
    ]
  end

  def docs do
    [
      source_ref: "v#{@version}",
      main: "introduction-overview",
      extra_section: "guides",
      formatters: ["html", "epub"],
      groups_for_modules: groups_for_modules(),
      extras: extras(),
      groups_for_extras: groups_for_extras()
    ]
  end

  defp extras do
    [
      "guides/introduction/overview.md": [
        filename: "introduction-overview"
      ],
      "guides/introduction/installation.md": [
        filename: "introduction-installation"
      ],
      "guides/introduction/configuration.md": [
        filename: "introduction-configuration"
      ],
      "guides/introduction/customization.md": [
        filename: "introduction-customization"
      ],
      "guides/tutorials/getting-started.md": [
        filename: "tutorials-getting-started"
      ],
      "guides/support/statistics.md": [
        filename: "support-statistics"
      ],
      "guides/support/benchmarking.md": [
        filename: "support-benchmarking"
      ],
      "guides/support/genealogy.md": [
        filename: "support-genealogy"
      ],
      "guides/operators/crossover.md": [
        filename: "operators-crossover"
      ]
    ]
  end

  defp groups_for_extras do
    [
      Introduction: Path.wildcard("guides/introduction/*.md"),
      Support: Path.wildcard("guides/support/*.md"),
      Tutorials: Path.wildcard("guides/tutorials/*.md"),
      Operators: Path.wildcard("guides/operators/*.md")
    ]
  end

  defp groups_for_modules do
    [
      Operators: [
        Genex.Operators.Crossover,
        Genex.Operators.Mutation,
        Genex.Operators.Selection
      ],
      Support: [
        Genex.Support.Genealogy
      ],
      Structures: [
        Genex.Population,
        Genex.Chromosome
      ]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:excoveralls, "~> 0.10", only: :test},
      {:table_rex, "~> 2.0.0"},
      {:benchee, "~> 1.0"},
      {:libgraph, "~> 0.13.0"}
    ]
  end

  defp description do
    "Genex makes it easy to write Genetic Algorithms in Elixir."
  end

  defp package do
    [
      maintainers: @maintainers,
      name: "genex",
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "http://www.github.com/seanmor5/genex"}
    ]
  end
end
