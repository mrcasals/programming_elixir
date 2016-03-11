# Control flow

# if/else/unless
if 1 ==1, do: "true part", else: "false part"
if 1 ==1 do
  "true part"
else
  "false part"
end

# cond
# Can be rewritten as pattern matching in function calls:
defmodule FizzBuzz do
  def upto(n) when n > 0 do
    1..n |> Enum.map(&fizzbuzz/1)
  end

  # defp fizzbuzz(n) do
  #   cond do
  #     rem(n, 3) == 0 && rem(n, 5) == 0 ->
  #       "FizzBuzz"
  #     rem(n, 3) == 0 ->
  #       "Fizz"
  #     rem(n, 5) == 0 ->
  #       "Buzz"
  #     true ->
  #       n
  #   end
  # end

  defp fizzbuzz(n) when rem(3, n) == 0 and rem(5, n) == 0, do: "FizzBuzz"
  defp fizzbuzz(n) when rem(3, n) == 0, do: "Fizz"
  defp fizzbuzz(n) when rem(5, n) == 0, do: "Buzz"
  defp fizzbuzz(n), do: n

  # Exercise: ControlFlow-2
  # defp fizzbuzz(n) do
  #   case [rem(n, 3), rem(n, 5)] do
  #     [0, 0] -> "FizzBuzz"
  #     [0, _] -> "Fizz"
  #     [_, 0] -> "Buzz"
  #     _ -> n
  #   end
  # end
end

# case
dave = %{name: "Dave", age: 27}
case dave do
  person = %{age: age} when is_number(age) and age >= 21 ->
    IO.puts "Yay!"
  _ ->
    IO.puts "Nay"
end

# Exceptions
# raise "Booo" # (RuntimeError) Boo
# raise RuntimeError, message: "Boo" # (RuntimeError) Boo
