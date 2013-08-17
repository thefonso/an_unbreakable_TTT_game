require 'game_io'
require 'game'
require 'board'

describe Game do
  it 'Doug should not beat the game' do
    test_input  = StringIO.new("2\n6\n8\n7\n")
    test_output = StringIO.new
    io          = GameIO.new(test_input, test_output)
    player_1    = Human.new("O", io)
    player_2    = AIhard.new("X", io)
    board       = Board.new
    game        = Game.new(player_1, player_2, board, io)

    game.start
    # hmmm, I think this should say should_not include "O has won!"...since zero is Human -fonso
    test_output.string.should_not include "O has won!"
  end

  context "plays until board is full" do
    it 'plays until game board is full resulting in a draw' do
      test_input  = StringIO.new("0\n6\n5\n1\n7\n")
      test_output = StringIO.new
      io          = GameIO.new(test_input, test_output)
      player_1    = Human.new("O", io)
      player_2    = AIhard.new("X", io)
      board       = Board.new
      game        = Game.new(player_1, player_2, board, io)

      game.start
      test_output.string.should include "The game is a DRAW"
    end

    it 'plays until game board is full resulting in a win for player X' do
      test_input  = StringIO.new("0\n1\n")
      test_output = StringIO.new
      io          = GameIO.new(test_input, test_output)
      player_1    = Human.new("O", io)
      player_2    = AIhard.new("X", io)
      board       = Board.new()
      game        = Game.new(player_1, player_2, board, io)

      game.start
      test_output.string.should include "X has won!"
    end

    it 'plays until game board is full resulting in a win for player O' do
      test_input  = StringIO.new
      test_output = StringIO.new
      io          = GameIO.new(test_input, test_output)
      player_1    = Human.new("O", io)
      player_2    = AIhard.new("X", io)
      board       = Board.new(Array.new(9, "O"))
      game        = Game.new(player_1, player_2, board, io)

      game.start
      test_output.string.should include "O has won!"
    end
  end
end
