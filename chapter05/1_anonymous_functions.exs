# Anonymous functions
sum = fn (a, b) -> a + b end
sum.(1, 2)

greet = fn -> IO.puts "Hello" end
greet.()

# Exercise: Functions-1
list_concat = fn (a, b) -> a ++ b end
sum = fn a, b, c -> a + b + c end
pair_tuple_to_list = fn({a, b}) -> [a, b] end

# Pattern matching
handle_open = fn
  {:ok, file} -> "Read data: #{IO.read(file, :line)}"
  {_, error} -> "Error: #{:file.format_error(error)}" # :file is Erlang's file module
end

# Exercise: Functions-2
fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, n -> n
end

# Exercise: Functions-3
rem_fizzbuzz = fn
  n -> fizzbuzz.(rem(n, 3), rem(n, 5), n)
end
[ rem_fizzbuzz.(10), rem_fizzbuzz.(11), rem_fizzbuzz.(12), rem_fizzbuzz.(13), rem_fizzbuzz.(14), rem_fizzbuzz.(15), rem_fizzbuzz.(16) ]

# Pinned values
defmodule Greeter do
  def for(name, greeting) do
    fn
      (^name) -> "#{greeting} #{name}"
      (_) -> "I don't know you"
    end
  end
end
mr_valim = Greeter.for("José", "Hi!")
mr_valim.("José") # => "Hi! José"
mr_valim.("Daniel") # => "I don't know you"

# Exercise: Functions-4
prefix = fn a -> (fn b -> "#{a} #{b}" end) end
mrs = prefix.("Mrs")
mrs.("Smith")

# Functions as arguments
times_2 = fn n -> n * 2 end
apply = fn (fun, value) -> fun.(value) end
apply.(times_2, 6)

# Short notation
add_one = &(&1 + 1) # & converts everything that follows into a fn. &1 is the first param, etc
square = &(&1 * &1)
# As this is a direct call to a function, it just redirects it to the function
# instead of creating a fn. This only works if the params are in order
speak = &(IO.puts(&1))
divrem = &{ div(&1, &2), rem(&1, &2)  }
l = &length(&1) # => l.([1, 2, 3, 4]) => 4
len = &Enum.count/1

Enum.map [1, 2, 3, 4], &(&1 *2)

# Exercise: Functions-5
Enum.map [1,2,3,4], &(&1 + 2)
Enum.map [1,2,3,4], &IO.inspect/1
