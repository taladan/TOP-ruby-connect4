# lib/board.rb
require 'matrix'
require_relative 'exceptions'
require_relative 'player'
require_relative 'display'

# this class describes a board object for playing a game of connect four
class Board
  attr_reader :board_matrix

  def initialize(matrix = Matrix.build(6, 7) { ' ' })
    # build a 6 row, 7 column matrix with each position holding an empty space
    @board_matrix = matrix
  end

  # player chose column to play
  def play(player, column)
    # raise error if column is full
    raise ColumnFull if column_full?(column)

    play_piece(player, column)
  end

  # test to see if all slots in the board are filled
  def full?
    # if there are any values of ' ' in @board matrix, it is not full
    !@board_matrix.any?(' ')
  end

  private

  # test to see if column is filled
  def column_full?(column)
    return true if @board_matrix.column(column).find_index(' ').nil?

    false
  end

  # put player's token in first empty slot of column
  def play_piece(player, column)
    @board_matrix[column, @board_matrix.column(column).find_index(' ')] = player.token
  end
end
