defmodule Knapsack do
  use Genex,
    crossover_type: :two_point,
    parent_selection: :roulette,
    mutation_type: :bit_flip

  @bound_breached 0

  def encoding, do: Chromosome.binary(size: Enum.count(weights()))

  def fitness_function(c) do
    profit =
      c.genes
      |> Enum.zip(profits())
      |> Enum.reduce(0, fn {g, p}, acc -> acc + g * p end)

    weight_carried =
      c.genes
      |> Enum.zip(weights())
      |> Enum.reduce(0, fn {g, w}, acc -> acc + g * w end)

    weight_allowed? = weight_carried <= weight_limit()

    if weight_allowed? do
      profit
    else
      @bound_breached
    end
  end

  def terminate?(p), do: p.generation == 1000

  defp profits, do: [6, 5, 8, 9, 6, 7, 3]
  defp weights, do: [2, 3, 6, 7, 5, 9, 4]
  defp weight_limit, do: 12

  # Other examples from https://www.guru99.com/knapsack-problem-dynamic-programming.html
  # defp profits, do: [3, 4, 4, 10, 4]
  # defp weights, do: [3, 4, 5, 9, 4]
  # defp weight_limit, do: 11
  # defp profits, do: [4, 2, 1, 2, 10]
  # defp weights, do: [12, 2, 1, 1, 4]
  # defp weight_limit, do: 15
end

import Genex.Config

[population_size: 50]
|> use_crossover(:two_point)
|> use_selection(:roulette)
|> Knapsack.run()
