# Strings
"this is a string"
~w[a list of strings]
~w[a list of strings]s
~w[a list of atoms]a
~w[a list of character lists]c
heredoc_string = """
ai
ai
ai
"""

# Character lists
str = 'wombat'
is_list str # => true
length str # 6
Enum.reverse str # tabmow
[67, 65, 84] # 'CAT'o
'pole' ++ 'vault' # 'polevault'
'pole' -- 'vault' # 'poe'
[head|tail] = 'cat' # head => 99, tail => 'at'o

defmodule MyStr do
  # Exercise: StringsAndBinaries-1
  # Examples:
  # MyStr.printable?('cat')
  # MyStr.printable?('∂x/∂y')
  def printable?(str), do: Enum.all?(str, fn ch -> ch in ? ..?~ end)

  # Exercise: StringsAndBinaries-2
  def anagram?(str1, str2), do: Enum.sort(str1) == Enum.sort(str2)
end
