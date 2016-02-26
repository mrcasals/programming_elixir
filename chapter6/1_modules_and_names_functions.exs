# Modules
defmodule Times do
  def double(n) do
    n * 2
  end
end

# Exercise: ModulesandFunctions-1
# Exercise: ModulesandFunctions-2
# Exercise: ModulesandFunctions-3
defmodule Times do
  def double(n), do: n * 2
  def triple(n), do: n * 3
  def quadruple(n), do: double(n) + double(n)
end

# Pattern matching
defmodule Factorial do
  def of(0), do: 1
  def of(n), do: n * of(n - 1)
end

# Exercise: ModulesandFunctions-4
# Exercise: ModulesandFunctions-5
defmodule ArithmeticExample do
  def sum(0), do: 0
  def sum(n), do: n + sum(n - 1)

  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))
end

# Guard clauses
# http://elixir-lang.org/getting-started/case-cond-and-if.html#expressions-in-guard-clauses
defmodule Factorial do
  def of(0), do: 1
  def of(n) when n > 0 do
    n * of(n - 1)
  end
end
# Factorial.of(-100) # => ** (FunctionClauseError) no function clause matching in Factorial.of/1

# Default values
defmodule DefaultValuesExample do
  def func(p1, p2 \\ 2, p3 \\ 3, p4) do
    IO.inspect [p1, p2, p3, p4]
  end
end
DefaultValuesExample.func("a", "b")
# => ["a",2,3,"b"]
DefaultValuesExample.func("a", "b", "c")
# => ["a","b",3,"c"]
DefaultValuesExample.func("a", "b", "c", "d")
# => ["a","b","c","d"]

# Example: ModulesandFunctions-6
defmodule Chop do
  def guess(actual, range = low..high) do
    guess = div(low+high, 2)
    IO.puts "Is it #{guess}?"
    _guess(actual, guess, range)
  end

  defp _guess(actual, actual, _),
    do: IO.puts "Yes, its #{actual}"

  defp _guess(actual, guess, _low..high)
    when guess < actual,
    do: guess(actual, guess+1..high)

  defp _guess(actual, guess, low.._high)
    when guess > actual,
    do: guess(actual, low..guess-1)
end

# Pipe operator
# Result is passed as first param
# Pre:
#   people = DB.find_customers
#   orders = Orders.for_customers(people)
#   tax    = sales_tax(orders, 2013)
#   filing = prepare_filing(tax)
#
# After:
#   filing = DB.find_customers
#              |> Orders.for_customers
#              |> sales_tax(2013) # 2013 is the 2nd argument!
#              |> prepare_filing

# Modules
defmodule ModulesExample do
  # alias My.Other.Module.Parser, as: Parser
  # alias My.Other.Module.Runner # => will be aliased as `Runner`
  # alias My.Other.Module.{Runner, Parser}

  def func1, do: List.flatten [1, [2, 3], 4]
  def func2 do
    import List, only: [flatten: 1] # also `except:` is available
    flatten [5, [6, 7], 8]
  end

  @attr "One" # similar to constants
  def first, do: @attr
  @attr "Two"
  def second, do: @attr
end

ModulesExample.first # => "One"
ModulesExample.second # => "Two"

