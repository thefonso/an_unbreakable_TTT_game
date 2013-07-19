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
# select difficulty
# easy or hard
#
# select player 
# X or O
#
# select board
# 3x3 or 4x4

game.start
