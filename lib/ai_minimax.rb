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
    #TODO
    #receive a move, symbol, and location
    #score the move
    opponent = switch_player(player_symbol) 
    new_board = move_as_somebody(board, player_symbol, empty_space)
    
    if three_in_a_row_win?(new_board, player_symbol)
      return 1
    elsif three_in_a_row_win?(new_board, opponent)
      return -1
    elsif draw?(new_board)
      return 0
    end

    #TODO 
    #find empty spaces on an incoming board
    #
    newboard_hash = Hash[(0...new_board.size).zip new_board]
    empty_spaces = newboard_hash.select{ |k,v| v == '+' }.keys 
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
      opponent = switch_player(player_symbol) 
      p opponent
      p space
      p "CLONED_BOARD with SPACE"
      cloned_again_board = cloned_board.clone
      cloned_again_board[space] = player_symbol
      p cloned_again_board

      if three_in_a_row_win?(cloned_again_board, player_symbol)
        scores_hash[space] = 1
      elsif three_in_a_row_win?(cloned_again_board, opponent)
        scores_hash[space] = -1
      elsif draw?(new_board)
        scores_hash[space] = 0
      end

      #scores_hash[space] = score_a_move(cloned_again_board,player_symbol,space)
      #score = score_a_move(cloned_again_board,player_symbol,space)
      #opponent_score = (score_a_move(cloned_again_board,opponent,space)*-1)

      #p "MY_SCORE "+space.to_s+" "+score.to_s
      #p "OPPONENT_SCORE "+space.to_s+" "+opponent_score.to_s
    end

    #TODO
    #do the same for the opponent
    #this is min 
    #
    p "SCORES_HASH "+scores_hash.to_s
    #return scores_hash
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
