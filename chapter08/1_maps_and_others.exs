# Maps, Keyword Lists, Sets, and Structs

# Keyword Lists
# Usually for options as function args
defmodule Canvas do
  @defaults [fg: "black", bg: "white", font: "Merriweather", font: "Comic Sans"]

  def draw_text(text, options \\ []) do
    options = Keyword.meerge(@defaults, options)
    IO.puts "Drawing text #{inspect(text)}"
    IO.puts "Foreground: #{options[:fg]}"
    IO.puts "Background: #{options[:bg]}"
    IO.puts "Font: #{Keyword.get_values(options, :font)}"
    IO.puts "Pattern: #{Keyword.get(options, :pattern, "solid")}"
  end
end

# Maps
map = %{ name: "Dave", likes: "Programming", where: "Dallas" }
Map.keys map
Map.values map
map[:name]
map.name
Map2 = Map.put map, :also_likes, "Ruby"
{ value, updated_map } = Map.pop map2, :also_likes

person = %{ name: "Dave", height: 1.88 }
%{name: a_name} = person
# a_name # => "Dave"
%{ name: _, weight: _ } = person # => (MatchError)

people = [
  %{ name: "Grumpy", height: 1.24 }
  %{ name: "Dave", height: 1.88 },
  %{ name: "Dopey", height: 1.32 },
  %{ name: "Shaquille", height: 2.16 },
  %{ name: "Sneezy", height: 1.28 }
]

for person = %{ height: height } <- people,
  height > 1.5,
  do: IO.inspect person # prints Dave and Shaquille maps

# Pattern matching cannot bind keys
%{ 2 => state } = %{ 1 => :ok, 2 => :error }
# state # => :error
%{ item => :error } = %{ 1 => :ok, 2 => :error } # => (CompileError)

# updating a map
m = %{a: 1, b: 2}
m1 = %{m | b: "two"}

# Structs
defmodule Subscriber do
  defstruct name: "", paid: false, over_18: true
end
s1 = %Subscriber{}
s2 = %Subscriber{name: "Dave"}
s2.name
