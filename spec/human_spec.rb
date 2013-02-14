require 'human'
require 'board'

describe 'Human class' do
  before (:each) do
    @board = Board.new
    @human = Human.new
  end

  it 'should see a board' do
    @human.makes_move(board).should == "bob"
  end

  xit 'should put play on board' do
  end

end

