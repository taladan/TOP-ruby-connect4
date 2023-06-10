# lib/display.rb

class Display
  def clear
    system 'clear'
  end

  # prompts stdout for the name of `player`
  #   expects: string format of "Player N" for display, outputs: string
  def prompt_for_name(player)
    puts "Enter name for #{player}:"
    name = gets.chomp
  end

  # loop until number 0-7.  Need to make this
  # a non hardcoded value.
  def prompt_for_play
    puts 'Enter which column number [0-6] you want to play:'
    column = nil
    column = gets.chomp until column =~ /^[0-6]$/
    column
  end

  def intro
   puts <<~INTRO
    Welcome to Connect Four!

    This is a two player game.  Each player gets a token '◯' that is colored either red or yellow.  
    The object of the game is to line up four consecutive tokens either in a column, row, or diagonal
    before your opponent does.

    The game will prompt each player to enter a column they wish to play in, from 0 to 6.

    The game will end when it detects four identical consecutive tokens in either a column, row, or diagonal.

   INTRO
  end

  def print_board(matrix)
    rows = matrix.row_count - 1
    rows.downto(0) do |num|
      matrix.row(num).each do |spot|
        print " #{spot} "
      end
      print "\n\n"
    end
  end
end