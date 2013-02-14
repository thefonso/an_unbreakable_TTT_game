require 'game'
require 'ai'
require 'human'
require 'player'

describe 'Game class' do
  before (:each) do
    @board = Board.new
    @human = Human.new
    @ai    = AI.new
  end

  it 'should have a board' do
    game = Game.new
    game.board.should_not be_nil
  end

  it 'should ask human to put play on board' do
    @human.should
  end
end


