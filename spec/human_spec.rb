require 'human'
require 'board'

describe 'Human class' do
  before (:each) do
    @board = Board.new
  end
  it 'should receive play from input' do
    $stdin.stub(:gets).and_return(1)
    human = Human.new
    human.make_move.should_not be_nil
  end

  xit 'should place move in upper right corner' do
    $stdin.stub(:gets).and_return('0')
    human = Human.new
    human.make_move.should == '0'
  end
end
