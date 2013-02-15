require 'ai'
require 'board'

describe 'ai class' do
  before (:each) do
    @board = Board.new
  end
  it 'should receive play from input' do
    $stdin.stub(:gets).and_return(1)
    ai = AI.new
    ai.make_move.should_not be_nil
  end
end


