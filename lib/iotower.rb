class IOtower
  
  def initialize(io = $stdin)
    @io = io
  end

  def display_message_start
    p "Welcome to TTT get ready to play!"
  end

  def display_message_end
    p "Game Over" # TODO - find result win or draw
  end

  def prompt_next_player
    #if AI
    # p "AI takes move...."
    #else
    # p "Human takes move..."
    # end
  end

  def redraw_board
    # draws the current game board 
    # @board.printgrid maybe
  end

end
