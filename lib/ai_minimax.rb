require 'facets'
require_relative 'windetection'
require 'pry'

class Minmax 
  include WinDetection

  attr_accessor :i

  def initialize
    @i = 0
  end

  def first_move
    start_moves = [0, 2, 4, 6, 8].sample
    return start_moves
  end

  def first_move?(board)
    board == ["+", "+", "+", "+", "+", "+", "+", "+", "+"]
  end

  def minmax(board, player)

    return first_move if first_move?(board)
  
    
    opponent = switch_player(player)
    clonedboards_hash = Hash.new 

    cloned_board = Board.new
    cloned_board = board.grid.clone
    # binding.pry

    if draw?(cloned_board)
      return 0
    else
      i=0
      ply_depth = 0

      board_hash = Hash[(0...board.grid.size).zip board.grid]
      empty_spaces = board_hash.select{ |k,v| v == '+' }.keys 
      empty_spaces.each do |space|

        cloned_again_board = board.grid.clone
        cloned_again_board[space] = switch_player(player)
        clonedboards_hash[i] = cloned_again_board

        i += 1 

        if score_a_move(cloned_board, player, space) == 1
          return space
        elsif score_a_move(cloned_board, opponent, space) == 1
          return space
        else
        end

      end
      ply_depth += 1

      #binding.pry
      clonedboards_hash.each do |key,nextlevel_board|
        #TODO
        # How do I get this recursion going?
        # parts of equation...ply_depth, score_a_move, clonedboards_hash
        #
        # Q.what is base case?
        # A.score_a_move() == 1
        board_hash = Hash[(0...nextlevel_board.size).zip nextlevel_board]
        empty_spaces = board_hash.select{ |k,v| v == '+' }.keys 
        empty_spaces.each do |space|

          if score_a_move(nextlevel_board, player, space) == 1
            return space
          elsif score_a_move(nextlevel_board, opponent, space) == 1
            return space
          else
          end

        end
      end
    end
  end


  def score_a_move(board, player_symbol, empty_space)
    #TODO
    #move bulk of code here...
    #...recursive this method
    #
    opponent = switch_player(player_symbol) 
    #binding.pry
    cloned_again_board = board.clone
    cloned_again_board[empty_space] = player_symbol

    if three_in_a_row_win?(cloned_again_board, player_symbol)
      return 1
    elsif three_in_a_row_win?(cloned_again_board, opponent)
      return -1
    else
      return 0
    end

  end

  def move_as_somebody(board, player, empty_space)
    board[empty_space] = player
    @i+=1 # TODO forgot why this is here....why is this here?
    return board
  end

  def draw?(grid)
    grid.none? { |mark| mark == '+' }
  end

  def switch_player(player_symbol)
    player_symbol == 'X' ? 'O' : 'X'
  end
end
