require 'game'
require 'ai'
require 'human'
require 'player'

describe 'Game class' do
  before (:each) do
    @board = Board.new
    @human = Human.new
    @ai    = AI.new
    @player_1 = @human
    @player_2 = @ai
    @game  = Game.new(@player_1, @player_2, @board)
  end

  it 'should have a board' do
    @game.board.should_not be_nil
  end

  xit 'should display a board' do
  end

  xit 'should ask human to put play on board' do
    @human.make_move.should_not be_nil 
  end

  xit 'should ask AI to put play on board' do
    @ai.make_move.should_not be_nil 
  end
end


