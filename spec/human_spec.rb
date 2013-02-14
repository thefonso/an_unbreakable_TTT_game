require 'human'
require 'board'

describe 'Human class' do
  it 'should receive play from input' do
    Kernel.stub(:gets).and_return('1234567890')
    human = Human.new
    human.make_move.should_not be_nil
  end

  it 'should place move in upper right corner' do
    Kernel.stub(:gets).and_return('0')
    human = Human.new
    human.make_move.should == '0'
  end
end
