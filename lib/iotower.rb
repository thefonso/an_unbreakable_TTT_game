require 'game'
require 'board'

board = Board.new

class IOtower
  
  def initialize(io = $stdin)
    @io = io
  end

  def display_message_start
    p "Welcome to TTT get ready to play!"
  end

  def display_message_end
    p "Game Over" # TODO - find result... win or draw
  end

  def message(who_i_am)
    if who_i_am == 'human'
      human_move_message
    else
      ai_move_message
    end
  end

  def human_move_message
    p "Human move..."
  end

  def ai_move_message
    p "AI move..."
  end

  def redraw_board(grid)
    # TODO - draws the current game board 
    # @board.printgrid maybe
    board = "\n"
    board << " #{grid[0]} | #{grid[1]} | #{grid[2]}\n"
    board << "-----------\n"
    board << " #{grid[3]} | #{grid[4]} | #{grid[5]}\n"
    board << "-----------\n"
    board << " #{grid[6]} | #{grid[7]} | #{grid[8]} \n"
  end

end
