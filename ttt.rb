require './lib/board'
require './lib/game'
require './lib/human'
#require './lib/IOobject'
human = Human.new
board = Board.new
game = Game.new('O', 'X', board)

while !game.over?
  puts board.printgrid
  #move = Presenter.ask_for_move #Presenter comes from IO.
  move = human.make_move.to_i
  game.play_move(move)
  #Presenter.print_board(game.board.grid)
end
