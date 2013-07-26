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

["+","+","+",
"+","+","X",
"+","O","+"]

or just a 1 or -1 for a win or lose respectivly?

RSpec::Matchers.define :be_one_of do |list|
  match do |actual|
    list.include?(actual)
  end
end
expect(answer).to be_one_of([3,4,5,6,8])

["1","1","3","3","3","+","+","+","+"]

game start
"+","+","+",
"+","+","+",
"+","+","+"
turn == 0 / human("O") move first  / minimax board value?

"+","+","+",
"+","+","+",
"+","O","+"
turn == 1  / ai("X") move next / minimax board value?

"+","+","+",
"+","+","X",
"+","O","+"
turn == 2 / now human("O") move again / minimax board value?

"+","+","X",
"+","O","X",
"+","O","+"
turn == 3 / now ai("X") move / minimax board value?

"+","O","X",
"+","O","X",
"+","O","+"
turn == 4 / now human("O") move again / minimax board value == -1

 def who_won
    #TODO - ask about this...is there a better SOLID way? should this be here?
    if three_in_a_row_win?(@board.grid, @player_1.player_symbol)
      return "The winner is "+@player_1.player_symbol
    elsif three_in_a_row_win?(@board.grid, @player_2.player_symbol)
      return "The winner is "+@player_2.player_symbol
    elsif @board.grid.none? { |move| move == '+' }
      return "DRAW"
    end
  end
