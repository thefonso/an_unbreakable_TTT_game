require 'ai'
require 'board'

describe 'ai class' do
  before (:each) do
    @board = Board.new
    @ai    = Ai.new
  end

  xit 'should see a board' do
    @ai.makes_move(board).should == "bob"
  end
  xit 'should put play on board' do
  end
end


