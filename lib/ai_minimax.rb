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

    return first_move if first_move?(board)

  end


  def score_a_move(board, player_symbol, empty_space)
    opponent = switch_player(player_symbol) 
    depth = 0
    i=0
    clonedboards_hash = Hash.new 
    #TODO 
    #find empty spaces on an incoming board
    #
    board_hash = Hash[(0...board.size).zip board]
    empty_spaces = board_hash.select{ |k,v| v == '+' }.keys 
    p "EMPTY_SPACES "+empty_spaces.to_s

    #TODO
    #place one move from empty_spaces on the board
    #then score-that-move as a win, lose or draw... 
    #...and place that as a name => value into a hash
    #then reset the board and place the next move on the board 
    cloned_board = Board.new
    cloned_board = board.clone
    p "ORIGINAL_BOARD"
    p cloned_board
    #
    scores_hash = Hash.new

    empty_spaces.each do |space|
      cloned_again_board = cloned_board.clone

      p space
      p "CLONED_BOARD with SPACE"
      cloned_again_board[space] = player_symbol
      p cloned_again_board
      clonedboards_hash[i] = cloned_again_board
      
      i += 1 
      
      p "ENEMY_BOARD with SPACE"
      enemy_board = cloned_board.clone
      enemy_board[space] = opponent
      p enemy_board
      clonedboards_hash[i] = enemy_board

      i += 1 
      
      if three_in_a_row_win?(cloned_again_board, player_symbol)
        p "win"
        scores_hash[space] = 1
        board = cloned_again_board
        #return 1
      elsif three_in_a_row_win?(enemy_board, opponent)
        p "lose"
        scores_hash[space] = -1
        board = enemy_board
        #return -1
      elsif draw?(cloned_board)
        p "DRAW"
      end
    end
   # depth += 1

    if draw?(cloned_board) != true  
      score_a_move(board, player_symbol, opponent)
      depth += 1
      p "SCORES_HASH"+scores_hash.to_s+"  DEPTH "+depth.to_s
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
