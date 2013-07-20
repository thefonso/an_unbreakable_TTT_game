class MockIO
  attr_reader :game_input, :game_output
  def initialize(game_input, game_output)
    @game_input  = game_input
    @game_output = game_output
  end

  def output(msg)
    game_output.puts(msg)
  end

  def input
    game_input.gets.chomp.to_i
  end
end
