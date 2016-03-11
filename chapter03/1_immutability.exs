# It's better to prepend, as we can reuse old elements in memory. If we append,
# we would need to recreate all the elements, as pointers would change.
list1 = [ 3, 2, 1 ]
list2 = [ 4 | list1 ]
