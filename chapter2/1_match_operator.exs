# The match operator.
#
# Tries to make the left-hand side equal to the right-hand side.
a = 1

# This matches, as they are equal. It is not reassigning the value.
1 = a

# Pattern matching
list = [1, 2, [3, 4, 5]]

[a, b, c] = list
c # => [3, 4, 5]

[a, 2, c] = list
[a, 1, c] = list # => (MatchError)
[a, b] = [1, 2, 3] # => (MatchError)

a = [[1, 2, 3]] # => [[1, 2, 3]]
[a] = [[1, 2, 3]] # => [1, 2, 3]
[[a]] = [[1, 2, 3]] # => (MatchError)

[1, _, _] = [1, 2, 3] # underscore is ignored

# Using the variable value:
a = 1
a = 2
^a = 1 # => (MatchError)
