# lib/connect_four.rb
require './lib/board'
require './lib/player'
require './lib/display'
require './lib/cf_helpers'

# A game of connect four
class ConnectFour
  def initialize
    @board = Board.new
    @display = Display.new(@board.board_matrix)
  end

  def run
    @display.clear
    @display.intro
    initialize_players
    game_loop
  end

  private

  def game_loop
    current_player = @player1
  end

  def initialize_players
    @player1 = Player.new(display.prompt_for_name('Player 1'), 'red')
    @player2 = Player.new(display.prompt_for_name('Player 2'), 'yellow')
  end
end
