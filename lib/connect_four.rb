# lib/connect_four.rb
require './lib/board'
require '.lib/player'

# A game of connect four
class ConnectFour
  def initialize(player1, player2)
    @player1 = Player.new(player1, 'red')
    @player2 = Player.new(player2, 'yellow')
    @board = Board.new
  end
end
