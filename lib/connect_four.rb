# lib/connect_four.rb
require './lib/board'
require './lib/player'
require './lib/display'

# A game of connect four
class ConnectFour
  def initialize
    @display = Display.new
  end

  def run
    play_again = true
    intro
    initialize_players
    while play_again
      @board = Board.new
      game_loop
      play_again = @display.play_again?
    end
  end

  private

  def intro
    @display.clear
    @display.intro
  end

  def game_loop
    # initialize variables
    @current_player = @player1
    stop_playing = false
    until stop_playing
      if @board.game_over?
        stop_playing = true
        end_game
      else
        update_screen
        stop_playing, response = prompt_for_input
        begin 
          @board.play(@current_player, response.to_i)
          @current_player = swap_player
        rescue ColumnFull
          @display.column_full_message
          sleep(0.50)
        end
      end
    end
  end

  def prompt_for_input
    response = @display.prompt_for_play(@current_player.name)
    if response == 'exit'
      @display.quit
      stop_playing = true
    end
    [stop_playing, response]
  end

  def end_game
    update_screen
    @display.game_end(@player1, @player2, @board.winner)
  end

  def update_screen
    @display.clear
    @display.print_board(@board.board_matrix)
  end

  def initialize_players
    @player1 = Player.new(@display.prompt_for_name('Player 1'), 'red')
    @player2 = Player.new(@display.prompt_for_name('Player 2'), 'blue')
  end

  def swap_player
    return @player2 if @current_player == @player1
    return @player1 if @current_player == @player2
  end
end
