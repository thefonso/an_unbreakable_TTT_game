require 'iotower'
require 'human'
require 'ai'

describe 'IOtower class' do
  before (:each) do
    @io = IOtower.new
    @ui = mock(:ui)
    @ui.stub(:puts)
  end
  
  context "display_message_start" do
    it 'should display a welcome message'do
      @io.display_message_start.should == "Welcome to TTT get ready to play!" 
    end
  end

  context "display_messgae_end" do
    it 'should display Game Over message' do
      @io.display_message_end.should == "Game Over" 
    end
  end
  context "prompt_next_player" do
    it 'should receive play from standard input for human' do
      @ui.stub(:gets).and_return('1')
      human = Human.new(@ui)
      human.make_move.should == 1
    end

    it 'should receive play from standard input for AI' do
      @ui.stub(:gets).and_return('1')
      ai = AI.new(@ui)
      ai.make_move.should == 1
    end
  end

  context "redraw_board" do
    it 'should redraw the game board to the interface' do
      
    end
  end

end
