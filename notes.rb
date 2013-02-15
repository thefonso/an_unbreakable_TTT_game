require_relative 'board'
require_relative 'human'
require_relative 'ai'
# What does this need to do?
#
# IOobject (interface to CLI, Rails or Limelight)
#
# game(interacts with human, ai, board
# 
# human(returns a move)
# ai(returns a move)
# board(displays gameboard)
#
#
class Game
  attr_reader :board_state

  def initialize(player_1,player_2,board_state)
   @board_state = board_state
   @player_1 = player_1
   @player_2 = player_2
  end
  
  def drawgrid
    @board_state.printgrid
  end
  
  def next_move
    if current_player = 'ai'
      current_player.move
    end
  end

  def play
    get_human_move unless game.next_move
    update_board_display #sends game.board to IOobject
    evaluate_game
  end

  def update_board
  end

  def get_human_move
    IOobject.output("Enter move")
    move = IOobject.get_move

    if valid_move?(move)
      make_move(move)
      switch_player
    else
      display_error
      get_human_move
    end
  end

  def valid_move?(move)
    game.valid_move?(move)
  end

  def make_move(move)
    game.make_move(move)
  end

  def switch_player
    game.switch_player
  end

  def display_error
     IOobject.output("Opps - move not valid")
  end

  def finished?
    game.finished?
  end

  def evaluate_game
    if game.finished?
      display_message
    else
      prompt_next_player
      play
    end
  end

  def display_message
    if winner?
      winner_prompt
    else
      draw_prompt
    end
  end

  def winner_prompt
    winner = last_player
    IOobject.output("#{winner} is the winner!")
  end

  def draw_prompt
    IOobject.output("DRAW!")
  end

  def last_player
    switch_player
    current_player.to_s
  end

  def switch_player
  end

  def current_player
  end
end

