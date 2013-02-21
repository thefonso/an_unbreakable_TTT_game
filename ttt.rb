require './lib/board'
require './lib/game'
require './lib/human'
require './lib/iotower'
# TODO - make it so user can play human vs human
io    = IOtower.new
game  = Game.new(io)

game.setup

while !game.over?
  game.play
end
