["+", "O", "+", "+", "X", "+", "O", "+", "+"], ply = 0

["O", "O", "+", "+", "X", "+", "O", "+", "+"], ply = 1

ply = 1
next_boards
["O", "O", "+", "+", "X", "+", "O", "+", "+"]

["O", "O", "+", "+", "X", "+", "O", "+", "+"],
["+", "O", "O", "+", "X", "+", "O", "+", "+"],
["+", "O", "+", "O", "X", "+", "O", "+", "+"],
["+", "O", "+", "+", "X", "O", "O", "+", "+"],
["+", "O", "+", "+", "X", "+", "O", "O", "+"],
["+", "O", "+", "+", "X", "+", "O", "+", "O"]

#I need to test each empty space for each board below....each board. And rank value of each answer accordingly.

["O", "O", "+",
 "+", "X", "+",
 "O", "+", "+"],
return -1 (2)

["+", "O", "O",
 "+", "X", "+",
 "O", "+", "+"], 
return -1 (0)

["+", "O", "+",
 "O", "X", "+",
 "O", "+", "+"], 
return -1 (0)

["+", "O", "+",
 "+", "X", "O",
 "O", "+", "+"], 
return 0 #it goes down this branch...why?

["+", "O", "+",
 "+", "X", "+",
 "O", "O", "+"],
return -1 (8)

["+", "O", "+",
 "+", "X", "+",
 "O", "+", "O"], 
return -1 (7)

[[-1, 2], [-1, 0], [-1, 0], [-1, 8]]

#so how to extract duplicate inner [1] values?
