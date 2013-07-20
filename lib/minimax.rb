require 'facets'
require 'windetection'
require 'pry'

class Minimax 
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

  def get_move(board, player)
    # return best move
    cloned_board = board.grid.clone
    
    return first_move if first_move?(board)
    board_hash = Hash[(0...board.grid.size).zip board.grid]
    empty_spaces_on_board = board_hash.select{ |k,v| v == '+' }.keys  

    empty_spaces_on_board.each do |space|
      if score_a_move(cloned_board,player)[0] === 1
        return score_a_move(cloned_board,player)[1]
      elsif score_a_move(cloned_board,player)[0] === -1
        return score_a_move(cloned_board,player)[1]
      end
      return space
    end 
  end

  def score_a_move(board, player_symbol)
  # find best move
    
    opponent = switch_player(player_symbol)
    player_boards_hash = Hash.new
    enemy_boards_hash = Hash.new

    if draw?(board)
      return 0
    else
      #find all empty spaces on board 
      board_hash = Hash[(0...board.size).zip board]
      empty_spaces_on_board = board_hash.select{ |k,v| v == '+' }.keys 


      empty_spaces_on_board.each do |space|
        ply=0
        @cloned_board = board.clone
        @cloned_board[space] = player_symbol
        player_boards_hash[ply] = @cloned_board 

        @enemy_board = board.clone
        @enemy_board[space] = opponent
        enemy_boards_hash[ply] = @enemy_board
        ply+=1
        
        if three_in_a_row_win?(@cloned_board, player_symbol)
          return  1, space
        elsif three_in_a_row_win?(@enemy_board, opponent)
          return -1, space
        end
      end
      score_a_move(@enemy_board,player_symbol)
    end
  end


  def draw?(board)
    board_array = board
    board_array.none? { |mark| mark == '+' }
  end

  def switch_player(player_symbol)
    player_symbol == 'X' ? 'O' : 'X'
  end
end
