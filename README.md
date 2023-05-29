# [The Odin Project](https://theodinproject.com)

## [Connect Four](https://en.wikipedia.org/wiki/Connect_Four)

The assignment is to write a connect four game in Ruby using the concept of Test Driven Development to write. This will be a commandline/terminal implementation.

For this project, I think I'm going to need:

- board object: Should handle piece positioning, and insertion
- player object: Should know the player's name and the piece they have (red or yellow)
- display object: Should handle outputting the game board and instructions to the screen

These requirements may (and probably will) change as the project develops.

## Implemented

- ConnectFour
  - @player1, @player2, board
- Board
  - #play(player, column) - puts player token in column numbered 0 - 6
  - #full?
- Player
  - @name, @token
- Exceptions
  - ColumnFull
