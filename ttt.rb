require './lib/board'
require './lib/game'
require './lib/human'
require './lib/iotower'

human = Human.new
human.player_symbol = "X"

ai    = AIhard.new
ai.player_symbol = "O"
@board = Board.new
game = Game.new(ai, human, @board)

#TODO - set up configure_game senerio
#ai_easy = AIeasy.new

while !game.over?
  # TODO move what this next puts statment does to IOtower.print_board(game.board.grid)
  # puts board.printgrid
  # move = IOtower.ask_for_move #Presenter comes from IO.
  # move = # TODO - argh....what goes here now?
  puts game.drawgrid
  game.play_move(@board)
end
puts game.drawgrid
