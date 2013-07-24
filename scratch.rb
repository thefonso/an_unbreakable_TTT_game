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

[[-1, 2], [-1, 0], [-1, 0], [0, 2, 3, 7, 8], [-1, 8], [-1, 7]]

#so how to extract duplicate inner values?

should minimax return 0 for this board?

"+","+","+",
"+","+","X",
"+","O","+"

or just a 1 or -1 for a win or lose respectivly?

RSpec::Matchers.define :be_one_of do |list|
  match do |actual|
    list.include?(actual)
  end
end
expect(answer).to be_one_of([3,4,5,6,8])

