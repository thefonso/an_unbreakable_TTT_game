require 'pry'

class Human
  attr_accessor :player_symbol

  # holds what piece it is and returns a move
  # TODO - make it so IOtower ask end user for symbol selection
  # hold setting for this in external config.rb file as so ([human, 'X'] )

  def initialize(io = Kernel)
    @io = io
  end
  
  def make_move(board) 
    
    @io.puts "Human makes move..." # TODO - puts displayed by IO object in future refactor
    
    human_spot_to_take = @io.gets.chomp.to_i

    if human_spot_to_take >= 0 && human_spot_to_take < board.grid.length 
      if board.grid[human_spot_to_take] == "+"
        return human_spot_to_take
      else
        puts "spot taken...try again"
        make_move(baord)
      end
    else
      puts "Move out of bounds..try again"
      make_move(board)
    end
  end
end

