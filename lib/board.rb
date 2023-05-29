# lib/board.rb
require 'matrix'
require_relative 'player'
require_relative 'display'

# this class describes a board object for playing a game of connect four
class Board
  attr_reader :board_matrix

  def initialize
    # build a 6 row, 7 column matrix with each position holding an empty space
    @board_matrix = Matrix.build(6, 7) { ' ' }
  end
end
