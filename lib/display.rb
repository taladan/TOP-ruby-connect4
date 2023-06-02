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
    puts 'Enter which column number you want to play:'
    column = nil
    column = gets.chomp until column =~ /^[0-7]$/
    column
  end
end
