require './lib/board'
require './lib/game'
require './lib/human'
require './lib/iotower'
# TODO - make it so user can play human vs human and select Letter type
human = Human.new
human.player_symbol = 'X'
ai    = AI.new
ai.player_symbol = 'O'
board = Board.new
game = Game.new(ai, human, board)

while !game.over?
  # TODO move what this next puts statment does to IOtower.print_board(game.board.grid)
  puts board.printgrid

  #move = IOtower.ask_for_move #Presenter comes from IO.
  # move = # TODO - argh....what goes here now?
#  move = human.make_move.to_i
  game.play
end
