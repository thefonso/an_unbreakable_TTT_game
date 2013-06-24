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
    score_a_move()
  end


  def score_a_move(board, player_symbol, empty_space)
    @count = 0
    #TODO
    #make a move
    #score the board
    #record the move and the score
    #place the move and the score in a hash
    #
    #TODO find empty spaces on incoming board
    empty_spaces = []
    board_hash = Hash[(0...board.size).zip board] 
    p "BOARD_HASH " + board_hash.to_s
    board_hash.each do |location,symbol|
      if symbol=='+'
        empty_spaces << location
      end
    end 
    p "empty_spaces "+empty_spaces.to_s

    scores_hash = Hash.new
    boards_hash = Array.new
    #TODO for each empty space, make a move, does the move win?
    empty_spaces.each do |position|
      newboard = move_as_somebody(board, player_symbol, position)
      
      p newboard.to_s
    end
    p "BOARDS_HASH"+boards_hash.to_s

    #TODO now score that move

    p "SCORES_HASH "+scores_hash.to_s
    return scores_hash
  end



  def move_as_somebody(board, player, empty_space)
    board[empty_space] = player
    @i+=1
    return board
  end

  def draw?(grid)
    grid.none? { |mark| mark == '+' }
  end

  def switch_player(player_symbol)
    player_symbol == 'X' ? 'O' : 'X'
  end
end
