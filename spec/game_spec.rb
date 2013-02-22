require 'game'
require 'iotower'

describe 'Game class' do
  before(:each) do
    io = IOtower.new
    @game = Game.new(io)
  end

  context "valid_move?" do
    it 'is true if board is empty' do
      @game.board.grid = [
        '+', '+', '+',
        '+', '+', '+',
        '+', '+', '+'
      ]

      @game.valid_move?(0).should be_true
    end

    it 'is false if move is taken' do
      @game.board.grid = [
        '0', '+', '+',
        '+', '+', '+',
        '+', '+', '+'
      ]

      @game.valid_move?(0).should be_false
    end
  end

  context "over?" do
    it 'is false if board is empty' do
      @game.board.grid = [
         '+', '+', '+',
         '+', '+', '+',
         '+', '+', '+'
      ]
      
      @game.over?.should be_false
    end

    it 'is false if board is not full' do
      @game.board.grid = [
         'O', '+', '+',
         '+', '+', '+',
         '+', '+', '+'
      ]
      
      @game.over?.should be_false
    end

    it 'is true if board is full' do
      @game.board.grid = [
         'O', 'O', 'O',
         'O', 'O', 'O',
         'O', 'O', 'O'
      ]
      
      @game.over?.should be_true
    end
  end

  context "evaluate_game" do
    it "should display message if game is over" do
      @game.board.grid = [
         'O', 'O', 'O',
         'O', 'O', 'O',
         'O', 'O', 'O'
      ]
      
      #@game.should_receive(:put_output) 
      @game.evaluate_game == "Game Over"
    end
  end

  context "play" do
    it "plays a move for O" do
      @game.should_receive(:ask_for_gamepiece).and_return('X') 
      @game.setup
      @game.board.grid = [
         '+', '+', '+',
         '+', '+', '+',
         '+', '+', '+'
      ]
      
      @game.play
      
      @game.board.grid[0].should == 'X'
    end

    it "plays a move for X" do
      @game.should_receive(:ask_for_gamepiece).and_return('O') 
      @game.setup
      @game.board.grid = [
         '+', '+', '+',
         '+', '+', '+',
         '+', '+', '+'
      ]
      
      @game.play
      
      @game.board.grid[0].should == 'O'
    end
  end

  context "choose_ai_gamepiece" do
    it 'should choose O option for player piece' do
      io = IOtower.new
      game = Game.new(io)
      game.player_1 = Human.new
      game.player_2 = AI.new
      game.player_1.player_symbol = 'X'

      game.choose_ai_gamepiece

      game.player_2.player_symbol.should == 'O'
    end

    it 'should choose X option for player piece' do
      io = IOtower.new
      game = Game.new(io)
      game.player_1 = Human.new
      game.player_2 = AI.new
      game.player_1.player_symbol = 'O'

      game.choose_ai_gamepiece

      game.player_2.player_symbol.should == 'X'
    end

  end

  context "switch_players" do
    it "should switch the current player" do
      io = IOtower.new
      game = Game.new(io)
      game.player_1 = Human.new
      game.player_2 = AI.new
      game.player_1.player_symbol = 'X'

      game.current_player = game.player_1

      # game.current_player.player_symbol
      game.switch_players
      game.current_player.should == game.player_2
    end
  end
end
