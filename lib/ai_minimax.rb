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
    board.grid == ["+", "+", "+", "+", "+", "+", "+", "+", "+"]
  end

  def minmax(board, player)

    opponent = switch_player(player) 
    return first_move if first_move?(board)

    depth = 1
    #i=0
    #clonedboards_hash = Hash.new 

    board_hash = Hash[(0...board.grid.size).zip board.grid]
    empty_spaces = board_hash.select{ |k,v| v == '+' }.keys 

    cloned_board = Board.new
    cloned_board = board.grid.clone
    # binding.pry
    # scores_hash = Hash.new

    if draw?(cloned_board)
      return 0
    else
      empty_spaces.each do |space|
        if score_a_move(cloned_board, player, space) == 1
          return space
        elsif score_a_move(cloned_board, opponent, space) == 1
          return space
        end
      end
    end

  end


  def score_a_move(board, player_symbol, empty_space)
    opponent = switch_player(player_symbol) 
    # depth = 1
    i=0
    clonedboards_hash = Hash.new 

    cloned_again_board = board.clone
    cloned_again_board[empty_space] = player_symbol
    clonedboards_hash[i] = cloned_again_board

    i += 1 

    enemy_board = board.clone
    enemy_board[empty_space] = opponent
    clonedboards_hash[i] = enemy_board
    #binding.pry

    i += 1 

    if three_in_a_row_win?(cloned_again_board, player_symbol)
      # scores_hash[1] = space
      return 1

    elsif three_in_a_row_win?(enemy_board, opponent)
      # scores_hash[-1] = space
      return -1
    end


    #depth += 1

    #TODO
    #How do I get this recursion going?

    # if scores_hash.max != nil
    #   #p "SCORES_HASH"+scores_hash.to_s+"  DEPTH "+depth.to_s
    #   return scores_hash.max.last
    # else
    #   clonedboards_hash.first do |key,secondboard|
    #     #p "SECONDBOARD"+secondboard.to_s
    #     score_a_move(secondboard, player_symbol, empty_space)
    #   end
    # end
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
