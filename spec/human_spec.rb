require 'human'
require 'board'

describe 'Human class' do
  before (:each) do
    @board = Board.new
    @ui = mock(:ui)
    @ui.stub(:puts) # this should be an io object that is passed into your Human class
  end

  it 'should receive play from input' do
    @ui.stub(:gets).and_return("1")
    human = Human.new(@ui)
    human.make_move(@board).should_not be_nil
  end

  it 'should hold either an X or O as a piece' do
    human = Human.new(@ui)
    human.player_symbol = 'X'
    human.player_symbol.should == 'X'
  end

end
