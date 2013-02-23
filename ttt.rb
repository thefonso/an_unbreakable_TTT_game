require_relative './lib/board'
require_relative './lib/game'
require_relative './lib/human'
require_relative './lib/iotower'
# TODO - make it so user can play human vs human
io    = IOtower.new
game  = Game.new(io)

game.setup

while !game.over?
  game.play
end
