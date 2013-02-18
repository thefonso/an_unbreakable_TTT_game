require './lib/board'
require './lib/game'
require './lib/human'
require './lib/iotower'

human = Human.new
board = Board.new
game = Game.new('O', 'X', board)

while !game.over?
  puts board.printgrid
  #move = IOtower.ask_for_move #Presenter comes from IO.
  game.play
  #IOtower.print_board(game.board.grid)
end
