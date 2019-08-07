# Configuration

Genex offers a number of customization options. This is a comprehensive list.

## Defaults
- `:population_size`: `100`
- `:crossover_type`: `:single_point`
- `:parent_selection`: `:natural`
- `:survivor_selection`: `:natural`
- `:mutation_type`: `:scramble`
- `:crossover_rate`: `0.75`
- `:mutation_rate`: `0.05`

## `crossover_type`

- `:single_point`
- `:two_point`
- `:uniform` *(requires `:uniform_crossover_rate` parameter set)*
- `:blend` *(requires `:alpha` parameter set)*
- `:simulated_binary` *(requires `:eta` parameter set)*
- `:messy_single_point`
- `:davis_order`

## `parent_selection` and `survivor_selection`

- `:natural`
- `:random`
- `:worst`
- `:roulette`
- `:tournament` *(requires `:tournsize` parameter set)*
- `:stochastic`

## `mutation_type`

- `:bit_flip`
- `:invert`
- `:scramble`
- `:gaussian`
- `:uniform_integer` *(requires `upper_bound` and `lower_bound` parameters set)*
- `:polynomial_bounded` *(requires `upper_bound`, `lower_bound` and `eta` parameters set)*
- `:none`