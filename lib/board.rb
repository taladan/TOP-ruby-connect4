# lib/board.rb
require 'matrix'
require_relative 'cf_helpers'
require_relative 'exceptions'
require_relative 'player'

# this class describes a board object for playing a game of connect four
class Board
  include CfHelper
  attr_reader :board_matrix

  def initialize(matrix = Matrix.build(6, 7) { '◯' })
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
    # if there are any ◯ values in @board matrix, it is not full
    return true unless @board_matrix.any?('◯')

    false
  end

  private

  # test to see if column is filled
  def column_full?(col)
    # return true if there are no nil values in column
    return true unless @board_matrix.column(col).any?('◯')

    false
  end

  # put player's token in first empty slot of column
  def play_piece(player, col)
    row = @board_matrix.column(col).find_index('◯')
    @board_matrix[row, col] = player.token
  end
end
