require './lib/board'
require './lib/game'
require './lib/human'
require './lib/game_io'
require 'pry'
human               = Human.new
human.player_symbol = "X"
ai                  = AIhard.new
ai.player_symbol    = "O"
@board               = Board.new
io                  = GameIO.new

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
