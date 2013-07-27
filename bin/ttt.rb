$LOAD_PATH << File.expand_path("../../lib/", __FILE__)

require 'game'
require 'board'
require 'human'
require 'game_io'


#TODO - ask about 
# ex. 
# this is preferable: 
# player1 = Human.new("X", io_object) 
# 
# rather than:
# player1 = Human.new
# player2.player_symbol = "X"

io                  = GameIO.new

human               = Human.new("X", io)
ai                  = AIhard.new("O", io)

@board              = Board.new

game                = Game.new(ai, human, @board, io)

#TODO - set up configure_game senerio
# select difficulty
# easy or hard
#
# select player 
# X or O
#
# select board
# 3x3 or 4x4

game.start
