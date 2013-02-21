require 'iotower'
require 'human'
require 'ai'

describe 'IOtower class' do
  before (:each) do
    @drawbridge = mock("drawbridge")
    @io = IOtower.new(@drawbridge)
    @ui = mock(:ui)
    @ui.stub(:puts)
  end
  
  context "display_message_start" do
    it 'should display a welcome message'do
      @drawbridge.should_receive(:put_output).with("Welcome to TTT get ready to play!")
      @io.display_message_start
    end
  end

  context "display_messgae_end" do
    it 'should display Game Over message' do
      @drawbridge.should_receive(:put_output).with("Game Over")
      @io.display_message_end
    end
  end

  context "display_message_and_get_move" do
    it 'should display human message if the term human is received' do
      @drawbridge.should_receive(:put_output).with("Human move...")
      @drawbridge.should_receive(:get_input).and_return('1\n')
      @io.display_message_and_get_move('human')
    end
    
    it 'should display ai message if ai = who_i_am' do
      @drawbridge.should_receive(:put_output).with("AI move...")
      @drawbridge.should_receive(:get_input).and_return('1\n')
      @io.display_message_and_get_move('ai')
    end
  end

  context "human_move_message" do
    it 'should display human message if human = who_i_am' do
      @drawbridge.should_receive(:put_output).with("Human move...")
      @io.human_move_message
    end
  end

  context "ai_move_message" do
    it 'should display ai message if ai = who_i_am' do
      @drawbridge.should_receive(:put_output).with("AI move...")
      @io.ai_move_message
    end
  end

  context "redraw_board" do
    it 'should redraw the game board to the interface' do
      board = Board.new 
      @io.redraw_board(board.grid).should == <<-EOF.gsub(/^ {6}/, '')

       + | + | +
      -----------
       + | + | +
      -----------
       + | + | + 
    EOF
    end
  end

end
