require_relative 'board'
require_relative 'human'
require_relative 'ai'
require_relative 'iotower'
require_relative 'config'

class Game
  attr_reader :board
  attr_accessor :current_player
  attr_accessor :player_1
  attr_accessor :player_2

  def initialize(io)
   @board = Board.new
   @io = io
   @pieces = Configfile.pieces
  end
 
  def setup

    human = Human.new
    ai    = AI.new
    
    @player_1 = human #TODO - abstract this to IOtower so end-user can choose
    @player_2 = ai #TODO - abstract this to IOtower so end-user can choose
    @current_player = @player_1
    
    @player_1.player_symbol = ask_for_gamepiece

    choose_ai_gamepiece

  end

  def choose_ai_gamepiece
    if @player_1.player_symbol == @pieces[0]
      @player_2.player_symbol = @pieces[1]
    else
      @player_2.player_symbol = @pieces[0]
    end
  end

  def ask_for_gamepiece
    @io.human_gamepiece
  end

  def drawgrid
    @board.printgrid
  end

  def evaluate_game
    if over? == true
      @io.display_message_end
    else
      switch_players
    end
  end

  def play
    move = @io.display_message_and_get_move(@current_player)
    @board.grid[move] = @current_player.player_symbol
    evaluate_game
  end

  def switch_players  
    if @current_player.player_symbol == @player_1.player_symbol
      @current_player = @player_2
      @io.display_message_and_get_move(@player_2)
    else
      @current_player = @player_1
      @io.display_message_and_get_move(@player_1)
    end
  end

  def valid_move?(move)
    @board.grid[move] == '+'
  end

  def over?
    @board.grid.none? {|move| move == '+'}
  end

end
