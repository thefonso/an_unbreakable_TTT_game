require 'facets'
require_relative 'windetection'
require 'pry'

class Minmax 
  include WinDetection

  attr_accessor :i

  def initialize
    @i = 0
  end

  def minmax(board, player)
    if board.grid == ["+", "+", "+", "+", "+", "+", "+", "+", "+"]
      first_move
    else
      scores_hash = score_the_boards(board, player)

      max_hash = find_max_board(scores_hash)
      min_hash = find_min_board(scores_hash)

      answers = (max_hash.to_a - min_hash.to_a)

      intersect = Hash[*answers.flatten]

      max_move = intersect.select{|k,v| v == 'O'}.keys[0]
      #puts 'max_move '+max_move.to_s
      #min_move = intersect.select{|k,v| v == 'X'}.keys[0]
      #puts 'min_move '+min_move.to_s
      return max_move
    end
  end

  def find_max_board(scores_hash)
    max_board = scores_hash.max_by{|k,v| v}[0]
    # p "Max board "+max_board.to_s
    max_hash = {}
    max_board.each_with_index{|item, index| max_hash[index] = item}

    # p"max_hash "+max_hash.to_s
    return max_hash
  end

  def find_min_board(scores_hash)
    min_board = scores_hash.min_by{|k,v| v}[0]
    # puts "Min board "+min_board.to_s
    min_hash = {}
    min_board.each_with_index{|item, index| min_hash[index] = item}

    # p"min_hash "+min_hash.to_s
    return min_hash
  end

  def first_move
    start_moves = [0, 2, 4, 6, 8].sample
    return start_moves
  end

  def score_the_boards(board, player_symbol, ply)
    # TODO - make this a recursive method 
    @count = 0
    ply = 0
    test_boards_hash = {}
    test_boards_hash = generate_boards(board, player_symbol)
    # p "the test_boards_hash "+test_boards_hash.to_s
    scores_hash = {}
    test_boards_hash.each do |_,myboard|

      if three_in_a_row_win?(myboard, player_symbol) != nil 
        if three_in_a_row_win?(myboard, 'O') == true
          scores_hash[myboard] = 1  # win
        elsif three_in_a_row_win?(myboard, 'X') == true
          scores_hash[myboard] = -1 # lose
        else
          # do I even need the DRAW boards displayed?
          scores_hash[myboard] = 0  # draw
        end
      else
        puts 'D R A W'
      end

      ply -= 5
    end
    p scores_hash
    return scores_hash
  end


  def generate_boards(board, player)
    board_array = board.grid
    @virtual_board_hash ||= {}
    # convert incoming board array into a hash 
    board_to_hash = {}.compare_by_identity 
    board_array.each_with_index{|k,v| board_to_hash[v] = k}

    virtual_board_hash = board_to_hash.dup
    # puts 'virtual_board_hash '+virtual_board_hash.to_s
    empty_spaces = virtual_board_hash.select{ |k,v| v == '+' }.keys
    # puts 'empty_spaces '+empty_spaces.to_s
    empty_spaces.each do |space|

      cloned_board = Board.new
      cloned_board.grid = board.grid.clone

      if player == "O"        
        new_board = move_as_somebody(cloned_board, "X", space)
        # puts 'new_board 1 '+new_board.to_s
        new_player = "X"
        @virtual_board_hash[@i] = new_board.grid
      else
        new_board = move_as_somebody(cloned_board, "O", space)
        # puts 'new_board 2 '+new_board.to_s
        new_player = "O"
        @virtual_board_hash[@i] = new_board.grid
      end
      #convert hash into array
      generate_boards(new_board, new_player)
    end
    # p @virtual_board_hash
    return @virtual_board_hash
  end


  def move_as_somebody(board, player, empty_space)
    board.grid[empty_space] = player
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
