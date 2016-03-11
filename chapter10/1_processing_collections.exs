# Enum
list = Enum.to_list 1..5 # => [1, 2, 3, 4, 5]
Enum.concat([1, 2, 3], [4, 5, 6])

# Create list form a function
Enum.map(list, &(&1 * 10)) # => [10, 20, 30, 40, 50]
Enum.map(list, &String.duplicate("*", &1)) # => ["*", "**", "***", "****", "*****"]

# Select elements
Enum.at(10..20, 3) # => 13
Enum.at(10..20, 20) # => nil
Enum.at(10..20, 20, :no_one_here) # => :no_one_here
Enum.filter(list, &(&1 > 2))
Enum.reject(list, &Integer.is_even/1) # => [1, 3, 5]

# Streams
[1, 2, 3, 4]
|> Stream.map(&(&1*&1))
|> Stream.map(&(&1 + 1))
|> Stream.filter(fn x -> rem(x, 2) == 1 end)
|> Enum.to_list # => [5, 17]

# Comprehensions
for x <- [1, 2, 3, 4, 5], do: x * x
for x <- [1, 2, 3, 4, 5], x < 4, do: x * x

for x <- [1, 2], y <- [5, 6], do: x * y # => [5, 6, 10, 12]

min_maxes = [{1, 4}, {2, 3}, {10, 15}]
for {min, max} <- min_maxes, n <- min..max, do: n

for x <- ~w{ cat dog }, into: %{}, do: { x, String.upcase(x) }
