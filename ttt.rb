require './lib/board'
require './lib/game'
require './lib/human'
require './lib/iotower'

human = Human.new
ai    = AI.new
board = Board.new
game = Game.new(ai.player_symbol('O'),human.player_symbol('X'), board)

while !game.over?
  # TODO move what this next puts statment does to IOtower.print_board(game.board.grid)
  puts board.printgrid

  #move = IOtower.ask_for_move #Presenter comes from IO.
  move = # TODO - argh....what goes here now?
  game.play_move
 end
