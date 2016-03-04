# Lists
[a, b, c] = [1, 2, 3]
[head | tail] = [1, 2, 3]
# head # => 1
# tail # => [2, 3]

defmodule MyList do
  # Processing a list
  def len([]), do: 0
  def len([_head|tail]), do: 1 + len(tail)

  # Building a list
  def square([]), do: []
  def square([head|tail]), do: [head*head | square(tail)]

  def add_1([]), do: []
  def add_1([head|tail]), do: [head + 1 | add_1(tail)]

  # Ex: MyList.map [1,2,3,4], fn (n) -> n*n end
  # Ex: MyList.map [1,2,3,4], &(&1 * &1)
  # Ex: MyList.map [1,2,3,4], fn (n) -> n+1 end
  # Ex: MyList.map [1,2,3,4], &(&1 + 1)
  # Ex: MyList.map [1,2,3,4], fn (n) -> n > 2 end
  # Ex: MyList.map [1,2,3,4], &(&1 > 2)
  def map([], _func), do: []
  def map([head|tail], func), do: [ func.(head) | map(tail, func) ]

  # Keeping track of values during recursion
  # Could be implemented like the `len` method above, we we wouldn't be keeping
  # track of the values then
  def sum(list), do: _sum(list, 0)
  defp _sum([], total), do: total
  defp _sum([ head | tail ], total), do: _sum(tail, head + total)

  # Exercise: ListsAndRecursion-0
  def sum_2([]), do: 0
  def sum_2([head|tail]), do: head + sum_2(tail)

  # Generalizing our sum function
  # Ex: MyList.reduce([1,2,3,4,5], 1, &(&1 * &2))
  def reduce([], value, _), do: value
  def reduce([head|tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

  # Exercise: ListsAndRecursion-1
  def mapsum([], _), do: 0
  def mapsum([head|tail], func), do: func.(head) + mapsum(tail, func)

  # Exercise: ListsAndRecursion-2
  # First try:
  # def max(list), do: _max(list, 0)
  # defp _max([], value), do: value
  # defp _max([head|tail], value) do
  #   if head > value do
  #     value = head
  #   end
  #   _max(tail, value)
  # end
  def max([x]), do: x
  def max([head|tail]), do: Kernel.max(head, max(tail))

  # Exercise: ListsAndRecursion-3
  def caesar([], _n), do: []
  def caesar([head|tail], n)
    when head+n <= ?z,
    do: [head+n|caesar(tail, n)]
  def caesar([head|tail], n),
    do: [head+n-26|caesar(tail, n)]

  # Exercise: ListsAndRecursion-4
  def span(from, to) when from > to, do: []
  def span(from, to), do: [from | span(from+1, to)]
end

# List module
[1, 2, 3] ++ [4, 5, 6]

kw = [{:name, "Dave"}, {:likes, "Programming"}, {:where, "Dallas", "TX"}]
List.keyfind(kw, "Dallas", 1)
