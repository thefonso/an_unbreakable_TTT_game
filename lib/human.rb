require 'pry'

class Human
  attr_accessor :player_symbol

 
  def initialize(io = Kernel)
    @io = io
  end
  
  def make_move(board) 
    
    @io.puts "Human makes move..." # TODO - puts displayed by IO object in future refactor
   
    @io.gets.chomp.to_i            # TODO - have game_io indicate non valid moves 

  end
end

