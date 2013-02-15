require 'game'
require 'ai'
require 'human'
require 'board'

describe 'Game class' do
  before (:each) do
    @board = Board.new
    @human = Human.new
    @ai    = AI.new
    @player_1 = @human
    @player_2 = @ai
    @game  = Game.new(@player_1, @player_2, @board)
  end

  it 'should display game board state' do
    @board.should_receive(:printgrid)
    @game.drawgrid
  end

  xit 'should be able to switch players' do  
    @game.switch_players
  end

  xit 'should evaluate game' do
    @ai.make_move.should_not be_nil 
  end

  
end


