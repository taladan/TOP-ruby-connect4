# main.rb
#
# Describe the playing board:
# A Connect Four playing board is 2d array or matrix of positions
# that are formed in a "seven column, six row vertically suspended grid" (wikipedia)
# The game is played between two players, one with 'red' tokens and one with 'yellow' tokens
# Each player takes turns dropping a piece into the playing board (insertion).
# After each move, positions are checked in rows, columns, and diagonals to see if there are
# four of the same colored token in an uninterrupted, consecutive line.  If there are four
# tokens in a line, then the player controlling that color of token wins the game.
# If the board is filled and no consecutive lines of 4 tokens are created, this ends the game
# in a draw.
require './lib/connect_four'

game = ConnectFour.new
game.run
